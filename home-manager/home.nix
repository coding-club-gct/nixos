{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "april";
  home.homeDirectory = "/home/april";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = import ./user-packages.nix { inherit pkgs; };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/april/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.vscode = import ./vscode { inherit pkgs; };
  programs.git = {
    enable = true;
    userName = "useEffects";
    userEmail = "joel.sr1024@gmail.com";
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "mauve" ];
        size = "standard";
        tweaks = [ "rimless" "normal" ];
      };
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Mauve-Dark";
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_:true);
    };
  };
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "trayIconsReloaded@selfmade.pl"
        "quick-settings-tweaks@qwreey"
      ];
    };
    "org/gnome/extensions/user-theme" = {
      name = "'Catppuccin-Mocha-Standard-Mauve-Dark'";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "'prefer-dark'";
    };
    "org/gnome/desktop/background" = {
      "picture-uri" = "file:///etc/nixos/home-manager/wallpaper/wp11912480-catppuccin-wallpapers.png";
      "picture-uri-dark" = "file:///etc/nixos/home-manager/wallpaper/wp11912480-catppuccin-wallpapers.png";
    };
  };
  xdg =
    let
      themeDir = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}";
    in
    lib.mkIf config.gtk.enable {
      configFile."gtk-4.0/assets" = {
        source = "${themeDir}/gtk-4.0/assets";
        recursive = true;
      };
      configFile."gtk-4.0/gtk.css".source = "${themeDir}/gtk-4.0/gtk.css";
      configFile."gtk-4.0/gtk-dark.css".source = "${themeDir}/gtk-4.0/gtk-dark.css";
    };
}
