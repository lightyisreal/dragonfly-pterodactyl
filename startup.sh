#!/bin/bash

if [ ! -d /mnt/server/ ]; then
    mkdir -p /mnt/server/
fi

cd /mnt/server

export GOPRIVATE=${GOPRIVATE}

echo "machine ${GIT_SERVER} login ${GIT_USERNAME} password ${GIT_PASSWORD}" >> ~/.netrc

if [ ! -d "/mnt/server/src/" ]; then
    git clone ${GIT_REPO} /mnt/server/src
    cd /mnt/server/src
    git checkout ${GIT_BRANCH} || exit 1
    cd ..
else
    cd /mnt/server/src
    git checkout ${GIT_BRANCH} && git pull || exit 1
    cd ..
fi

go run /mnt/server/src/${MAIN_FILE}