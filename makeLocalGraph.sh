set -eu
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

nix-store -q --graph $(nix-build --no-out-link "$SCRIPTDIR/derivation/default.nix") | dot -Tsvg -o "$SCRIPTDIR/localOut.svg"

echo "Done creating local store graph."
