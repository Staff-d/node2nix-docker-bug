#!/bin/sh
nix-env --install graphviz
cp -r /derivation /myDerivation
nix-store -q --graph $(nix-build --no-out-link /myDerivation/default.nix) | dot -Tsvg -o /myOut/dockerOut.svg
