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
  openjdk17
  neofetch
  zsh
  gnome.gnome-tweaks
  gnomeExtensions.user-themes
  gnomeExtensions.tray-icons-reloaded
  gnomeExtensions.quick-settings-tweaker
  catppuccin-gtk
]
