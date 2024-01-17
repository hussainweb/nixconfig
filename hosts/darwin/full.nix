{ inputs, globals, ... }:

inputs.darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { };
  modules = [
    ../../modules/common
    ../../modules/darwin
    (globals // rec {
      user = "hw";
      longUsername = "hussainweb";
      gitName = "hw";
      gitEmail = "${longUsername}@gmail.com";
    })
    inputs.home-manager.darwinModules.home-manager
    {
      gui.enable = true;
      # theme = {
      #   colors = (import ../../colorscheme/gruvbox-dark).dark;
      #   dark = true;
      # };
      # mail.user = globals.user;
      charm.enable = true;
      # neovim.enable = true;
      # mail.enable = true;
      # mail.aerc.enable = true;
      # mail.himalaya.enable = false;
      # kitty.enable = true;
      # discord.enable = true;
      # firefox.enable = true;
      # dotfiles.enable = true;
      # nixlang.enable = true;
      # terraform.enable = true;
      # python.enable = true;
      # rust.enable = true;
      # lua.enable = true;
      # kubernetes.enable = true;
      # _1password.enable = true;
      # slack.enable = true;
    }
  ];
}
