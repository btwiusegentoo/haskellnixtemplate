{ pkgs }:
let
    haskellDeps = ps: with ps; [
        haskell-language-server
        base
        cabal-install
        lens
        mtl
    ];
    ghc = pkgs.haskellPackages.ghcWithHoogle haskellDeps;

    nixPackages = with pkgs; [
        ghc
        cabal2nix
        gdb
    ];
in
pkgs.mkShell {
    buildInputs = nixPackages;
}
