{ config, pkgs, lib, ... }:

{

  home-manager.users.${config.user} = lib.mkIf pkgs.stdenv.isDarwin {

    home.packages = with pkgs; [
      inetutils # Includes telnet
      youtube-dl # Convert web videos
      pandoc # Convert text documents
      awscli2
      ansible
      noti # Create notifications programmatically
      ipcalc # Make IP network calculations
    ];

    programs.fish.shellAbbrs = {
      # Add noti for ghpr in Darwin
      ghpr = lib.mkForce "gh pr create && sleep 3 && noti gh run watch";
      grw = lib.mkForce "noti gh run watch";

      # Shortcut to edit hosts file
      hosts = "sudo nvim /etc/hosts";
    };

  };

}
