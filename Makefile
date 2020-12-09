build:
	nix-build '<nixpkgs/nixos>' -A system \
    -I nixpkgs=$$(pwd)/nixpkgs \
    -I nixos-config=$$(pwd)/configuration.nix

build-docker:
	nix-build \
    -I nixpkgs=$$(pwd)/nixpkgs \
	hello-docker.nix
