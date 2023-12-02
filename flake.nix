{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... }:
    let
      shell = { pkgs, system }: with pkgs; mkShell (rec {
        buildInputs = with pkgs; [
          cbqn
          just
          nodePackages.nodemon
        ];
        nativeBuildInputs = [ clang ];

        LD_LIBRARY_PATH = "${lib.makeLibraryPath (buildInputs ++ nativeBuildInputs)}";
      });
    in
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      {
        devShells.default = shell { inherit pkgs system; };
      });
}
