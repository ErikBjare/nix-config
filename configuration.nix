{ pkgs, ... }: {
  nix = {
   package = pkgs.nixFlakes;
   extraOptions = ''
     experimental-features = nix-command flakes
   '';
  };

  networking.hostName = "template";  # TODO: fix
  networking.hostId = "af633c75";  # TODO: Set to something reasonable

  imports = [
    #<nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    #./hardware/hp-microserver.nix
    #./modules/force-my-version.nix
    # ./modules/rabbitmq-server.nix
    #./profile/server.nix
    #./users/binarin.nix
    #./packages/use-my-overlays.nix
    #./profile/emacs.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.devices = [ "/dev/sda" ];

  boot.supportedFilesystems = [ "zfs" ];

  services.zfs.autoScrub.enable = true;

  fileSystems."/" =
    { device = "tank/root/nixos";
      fsType = "zfs";
    };

  users.users.erb = {
    isNormalUser = true;
    home = "/home/erb";
    description = "Erik Bjäreholt";
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1000;
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2HFq0jG6x6qpM4FqjaBVec7iexKU+HaIPfRWyHdeRnBImleT4UNYyJTnzFs8/Y5hqm3CvhFLkVfl5iITKiIJPIi2bs9MbNqRqu9B2mFl7w2p8fUvfCpaS5dSd9iqSuhPJ47fBJ9XZSAgaTTZ2lUJkrnD/xXEgr4S8ZtHLNhhdZzaqB2kfD0ZrHF1FduusLVETtPR7kkbuLB30cccnbYlgLsNmo2oLB8kdII847f4+tI75B7StIluR+JlLR26n0DlT+bnecjlag37xho5FVihwWqdRvBzTzU+9SympZMailIiDXGsTYg0b4Lq5ds6kSHWN8jLErXuMScE8LezJS1fr erb@erb-main2-arcg" ];
  };

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
}
