{
  pkgs ? (import ./pinned-nixpkgs.nix){},
  nodejs ? pkgs.nodejs-14_x
}:
let
  unpreparedDependencies = (pkgs.callPackage ./support/dist.nix {inherit pkgs nodejs;});
  nodeDependencies = unpreparedDependencies.nodeDependencies.overrideAttrs(oldAttrs: rec {
    # The canvas has a bunch of C/C++ dependencies it wants to compile without specifing which ones in the package.json
    # So we'll have to manually fix these
    # Note: Thes following dependencies are now available in ALL node-package builders. Maybe we need to fix this someday ...
    # https://www.npmjs.com/package/canvas
    buildInputs = oldAttrs.buildInputs ++ (with pkgs;[ nodePackages.node-pre-gyp pkg-config pixman cairo libjpeg giflib librsvg pango]);
  });


in nodeDependencies
