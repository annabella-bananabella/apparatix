{ inputs, ... }:
{

  flake.nixosModules.nixpkgs.i18n = {

    defaultLocale = "en_US.UTF-8";

  };

}
