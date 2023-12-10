{ pkgs }:
{
  "redhat.telemetry.enabled" =  true;
  "window.zoomLevel" = 2;
  "files.autoSave" = "afterDelay";
  "workbench.colorTheme" = "Catppuccin Mocha";
  "java.jdt.ls.java.home" = "/nix/store/gfka0gfbh7yy2f8dzsk0i30lx9hmmzfa-openjdk-17.0.7+7/lib/openjdk";
  "java.configuration.runtime" = [
    {
      "name" = "JavaSE-17";
      "path" = "/nix/store/gfka0gfbh7yy2f8dzsk0i30lx9hmmzfa-openjdk-17.0.7+7/lib/openjdk";
      "default" = true;
    }
  ];
  "editor.wordWrap" = "on";
}
