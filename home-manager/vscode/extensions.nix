{ pkgs }:
with pkgs.vscode-extensions; [
  catppuccin.catppuccin-vsc
  jnoortheen.nix-ide
  ms-vscode.cpptools
  ms-vscode.cmake-tools
  ms-python.python
  redhat.java
  redhat.vscode-yaml
  redhat.vscode-xml
  vscjava.vscode-java-debug
  vscjava.vscode-java-test
  vscjava.vscode-maven
  vscjava.vscode-java-dependency
  twxs.cmake
] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-java-pack";
    publisher = "vscjava";
    version = "0.25.2023110908";
    sha256 = "d1471ebd69ba316c9e01db6b1cb0f80ac29007a8d4c90085c1e30e02ec2cf42f";
  }
  {
    name = "cpptools-extension-pack";
    publisher = "ms-vscode";
    version = "1.3.0";
    sha256 = "ac7493ec26025629ecddfa970be158892e5781c8e68bb416ecce3216b511d385";
  }
]
