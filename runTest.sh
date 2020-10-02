#!/usr/bin/env bash

set -eu
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$SCRIPTDIR/makeDockerGraph.sh
$SCRIPTDIR/makeLocalGraph.sh

echo "Test done. You can now inspect the output svgs."
