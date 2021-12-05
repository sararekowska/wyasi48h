{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { nixpkgs, self, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem
      (system:
      let 
        pkgs = import nixpkgs {
          config = { allowUnfree = false; };
          inherit system;
        };
      in {
        devShell =
          pkgs.mkShell {
            buildInputs = (import ./build-inputs.nix) { inherit pkgs; };
          };
        defaultPackage = import ./default.nix { inherit nixpkgs pkgs; };
        }
      );
}
