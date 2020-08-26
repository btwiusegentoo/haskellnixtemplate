let
    sources = import ./nix/sources.nix;
    pkgs = import sources.nixpkgs {};
    haskellDeps = ps: with ps; [
        base
        cabal-install
        lens
        mtl
    ];
    ghc = pkgs.haskellPackages.ghcWithPackages haskellDeps;

    nixPackages = with pkgs; [
        ghc
        cabal2nix
        gdb
    ];
in
pkgs.mkShell {
    buildInputs = nixPackages;
}
