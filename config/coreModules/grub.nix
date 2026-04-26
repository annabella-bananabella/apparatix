{ ... }:
{

  flake.nixosModules.nixpkgs.boot.loader = {

    efi = {
      canTouchEfiVariables = true; # Allows installation to modify EFI boot variables.
      efiSysMountPoint = "/boot/efi";
    };

    # This tells GRUB to install through EFI instead of independently.
    grub = {
      efiSupport = true;
      device = "nodev"; # Instead of on a specified disk.
    };

  };

}
