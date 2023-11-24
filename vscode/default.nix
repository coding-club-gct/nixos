{ pkgs }:
{
  enable = true;
  package = pkgs.vscode;
  userSettings = import ./user-settings.nix { inherit pkgs; };
  extensions = import ./extensions.nix { inherit pkgs; };
  mutableExtensionsDir = false;
}
