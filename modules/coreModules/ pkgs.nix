{ inputs, ... }:
{

  perSystem =
    { system, ... }:
    {

      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;

        # overlays = [ if I add overlays later I believe they go here ];

      };
    };
}
