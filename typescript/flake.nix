{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { flake-parts, ... }@inputs: let
    systems = [ "x86_64-linux", "aarch64-linux", "x86_64-darwin", "aarch64-darwin" ];
  in
    flake-parts.lib.mkFlake { inherit inputs; } {
      inherit systems;
      
      perSystem = { self', inputs', pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            typescript
            typescript-language-server
          ];
        };
      }
    }
}
