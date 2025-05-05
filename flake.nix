{
  description = "Dummy session";

  inputs.nixpkgs.url = "flake:nixpkgs";

  outputs = {nixpkgs, ...}:
    let
      forAllSystems = with nixpkgs; (lib.genAttrs lib.systems.flakeExposed);
      importPackage = system:
        nixpkgs.legacyPackages.${system}.callPackage ./package.nix {};
    in 
      {
        packages = forAllSystems importPackage;
      };
}
