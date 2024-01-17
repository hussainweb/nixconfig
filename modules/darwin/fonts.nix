{ config, pkgs, lib, ... }: {

  home-manager.users.${config.user} = lib.mkIf pkgs.stdenv.isDarwin {

    home.packages = with pkgs;
      [ (nerdfonts.override { fonts = [ 
        "0xProto"
        "CascadiaCode"
        "CascadiaMono"
        "DroidSansMono"
        "FiraCode"
        "Go-Mono"
        "Hack"
        "Inconsolata"
        "JetBrainsMono"
        "Monaspace"
      ]; }) ];

    # programs.alacritty.settings = { font.normal.family = "VictorMono"; };

    # programs.kitty.font = {
    #   package = (pkgs.nerdfonts.override { fonts = [ "VictorMono" ]; });
    #   name = "VictorMono Nerd Font Mono";
    # };

  };

}
