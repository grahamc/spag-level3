{
  description = "a project!";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.tar.gz";
    spag-level2.url = "https://flakehub.com/f/grahamc/spag-level2/0.tar.gz";
    spag-level1-b.url = "https://flakehub.com/f/grahamc/spag-level1-b/0.tar.gz";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    } @ inputs:
    {
      devShells = let pkgs = nixpkgs.legacyPackages.x86_64-linux; in {
        x86_64-linux.default = pkgs.mkShell {
          buildInputs = [ pkgs.toml-cli ];
        };
      };
    };
}
