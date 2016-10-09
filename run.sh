#!/bin/bash

set -euo pipefail

export PROJ='testapp'
export LOG_LVL='debug'

APPS=( "$@" )
for i in "${!APPS[@]}"; do
    # Pull the application path out of the command line arguments.
    tmp=${APPS[$i]}
    # Resolve the fully qualified path of the application.
    tmp=$(realpath "$tmp")
    # Trim the local GOPATH root off the front of the fully qualified path,
    # making it compatible with the docker container, which uses the GOPATH
    # root as it's working directory.
    tmp=${tmp#$GOPATH/}
    APPS[$i]=$tmp;
done

echo "running apps:"
printf '%s\n' "${APPS[@]}"

docker run \
    --rm \
    -p 8000:8000 \
    -p 8080-8090:8080-8090 \
    -v "$GOPATH":/go \
    kujenga/docker-gae-go \
    dev_appserver.py \
    --host='0.0.0.0' \
    --application="$PROJ" \
    --log_level="$LOG_LVL" \
    --dev_appserver_log_level="$LOG_LVL" \
    "${APPS[@]}"