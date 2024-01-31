{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation {
  name = "mkalias";

  buildInputs = [
    clang
    darwin.apple_sdk.frameworks.Foundation
  ];

  src = ./.;

  buildPhase = ''
    clang -framework Foundation mkalias.m -o mkalias
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp mkalias $out/bin/
  '';
}
