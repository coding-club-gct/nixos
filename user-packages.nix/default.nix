{ pkgs }:

let
  python-packages = ps: with ps; [
    pandas
    requests
  ];
in
with pkgs; [
  htop
  nixpkgs-fmt
  nodejs
  go
  docker
  docker-compose
  (python3.withPackages python-packages)
  nodePackages."pnpm"
  nodePackages."yarn"
  gcc
  git
  jdk17
  neofetch
  zsh
  hyprland
  gnomeExtensions.user-themes
  gnomeExtensions.tray-icons-reloaded
  gnomeExtensions.quick-settings-tweaker
  catppuccin-gtk
]
