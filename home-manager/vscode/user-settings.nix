{ pkgs }:
{
  "redhat.telemetry.enabled" =  true;
  "window.zoomLevel" = 2;
  "files.autoSave" = "afterDelay";
  "workbench.colorTheme" = "Catppuccin Mocha";
  "java.jdt.ls.java.home" = "${pkgs.openjdk17}/lib/openjdk";
  "java.configuration.runtime" = [
    {
      "name" = "JavaSE-17";
      "path" = "${pkgs.openjdk17}/lib/openjdk";
      "default" = true;
    }
  ];
  "editor.wordWrap" = "on";
}
