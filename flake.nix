{
  inputs = {

    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  };

  outputs =
    inputs:

    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      top@{
        config,
        withSystem,
        moduleWithSystem,
        ...
      }:
      let

        listNixFilesInDir =
          directory:
          with inputs.nixpkgs.lib.fileset;
          fileFilter (file: file.hasExt "nix") directory |> toList;

      in
      {

        systems = [ "x86_64-linux" ];

        imports = listNixFilesInDir ./modules;

      }
    );
}
