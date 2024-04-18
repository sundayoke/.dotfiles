#sudo nixos-rebuild switch --flake /path/to/your/flake#your-hostname
#sudo nixos-rebuild switch --flake /home/sunday/.dotfiles/.#peak-nixos
# If you are in the .dotfiles folder
# sudo nixos-rebuild switch --flake .#peak-nixos
{
  description = "My first flake!";

  inputs = {
      spotify.url ="nixpkgs/nixos-23.11";

    #nixpkgs.url = "nixpkgs/nixos-23.11";

    # use the following for unstable:
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # or any branch you want:
    # nixpkgs.url = "nixpkgs/{BRANCH-NAME}";

     # helix editor, use the master branch
    #helix.url = "github:helix-editor/helix/master";

    # Etcher use stable branch
    #etcher.url ="nixpkgs/nixos-23.11";



    #Wine use unstable branch
    #wineWowPackages.unstableFull.url = "nixpkgs/nixos-unstable";
    #vscode.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        peak-nixos = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
      };
    };
  };
}
