let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-25.05.tar.gz";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in
pkgs.mkShellNoCC {
  packages = [
    pkgs.pkg-config
    pkgs.pixman
    pkgs.xorg.libX11
    pkgs.xorg.libXft
    pkgs.xorg.libXinerama # fixed: was 'libxunerama'
    pkgs.gcc
  ];

  shellHook = ''
    echo "All packages installed successfully"
  '';
}
