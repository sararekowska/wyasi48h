{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  customGhc = haskellPackages.ghcWithPackages (pkgs: with pkgs; [
  ]);
in
[ customGhc ]
