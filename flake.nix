{

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    list-nix-files = {
      url = "github:apparatix/list-nix-files";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
      {

        systems = [ "x86_64-linux" ];

        imports = inputs.list-nix-files.multipleDirs [
          ./config
          ./options
        ];
      }
    );
}
