{ pkgs, nixpkgs }:
let
  lib          = nixpkgs.lib;
in
pkgs.pkgs.stdenv.mkDerivation rec {
  pname        = "sara-wyasi48h";
  version      = "0.0.0";
  unpackPhase  = ''
    true
    '';
  buildInputs  = (import ./build-inputs.nix) { inherit pkgs; };

  buildPhase   = ''
    echo "example file" > foo.txt
    '';

  # Everything in the $out/ will be available in the package in the store
  installPhase = ''
    mkdir -p $out/bin
    cp foo.txt $out/bin/foo.txt
    '';
}
