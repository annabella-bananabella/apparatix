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

        recListNixFiles = with inputs.nixpkgs.lib; rec {

          singleDir =
            directory:
            with fileset;

            fileFilter (file: file.hasExt "nix") directory |> toList;

          multipleDirs =
            directories:

            map singleDir directories |> flatten;

        };

      in
      {

        systems = [ "x86_64-linux" ];

        imports = recListNixFiles.multipleDirs [
          ./config
          ./options
        ];
      }
    );
}
