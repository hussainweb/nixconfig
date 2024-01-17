{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, darwin, nixpkgs, home-manager, ... }:
  let
    globals = rec {
      user = "hw";
      longUsername = "hussainweb";
      gitName = "hw";
      gitEmail = "${longUsername}@gmail.com";
    };
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#the-good-machine
    # darwinConfigurations."the-good-machine" = darwin.lib.darwinSystem {
    #   modules = [ 
    #     configuration
    #     home-manager.darwinModules.home-manager
    #       {
    #         home-manager.useGlobalPkgs = true;
    #         home-manager.useUserPackages = true;
    #         home-manager.users.hw = import ./home.nix;
    #       }
    #   ];
    # };

    darwinConfigurations = {
      "the-good-machine" = import ./hosts/darwin/full.nix { inherit inputs globals; };
    };

    homeConfigurations = {
      "the-good-machine" = self.darwinConfigurations."the-good-machine".config.home-manager.users.hw.home;
    };

    # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations."the-good-machine".pkgs;
  };
}
