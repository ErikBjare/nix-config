{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = [
    nixpkgs.nodejs
    nixpkgs.python
    nixpkgs.rust
  ];

in
  nixpkgs.stdenv.mkDerivation {
    name = "dev";
    buildInputs = pkgs;
  }
