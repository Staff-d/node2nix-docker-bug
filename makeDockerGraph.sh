#!/usr/bin/env bash

set -eu

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
docker run -it \
-v "$SCRIPTDIR/derivation:/derivation:ro" \
-v "$SCRIPTDIR/dockerout:/myOut:rw" \
-v "$SCRIPTDIR/dockerscripts:/scripts:ro" \
--entrypoint="/scripts/makeDockerGraph.sh" \
nixos/nix@sha256:2da921898aa6c89e2e60b1fb72d74525b8464b47412482c7f1cf77b8e707a099

cp "$SCRIPTDIR/dockerout/dockerOut.svg" "$SCRIPTDIR"
echo "Done creating the docker store graph."
