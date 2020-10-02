{
    nixpkgs ? null
}:

let
  spec =
  {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "55079328c219fb53f3120a34fdba3a80d3be601b";
    sha256 = "0imgkaf4x5k184nqdbrz31fmng69rn7d9na1a4kpv6swq9vnwbfj";

  };
  url = "https://github.com/${spec.owner}/${spec.repo}/archive/${spec.rev}.tar.gz";

  nixpkgsSrc =
    if isNull nixpkgs
      then
        builtins.fetchTarball {url = url; sha256 = spec.sha256;}
      else nixpkgs;

  pkgs = import nixpkgsSrc{};

in pkgs
