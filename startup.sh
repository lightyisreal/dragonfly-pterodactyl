#!/bin/bash

export GOPRIVATE=${GOPRIVATE}

cd ~

rm ~/.netrc ~/.wget-hsts

mkdir test

echo "machine ${GIT_SERVER} login ${GIT_USERNAME} password ${GIT_PASSWORD}" >> ~/.netrc

if [ ! -d "~/src/" ]; then
    git clone ${GIT_REPO} ~/src
    cd ~/src
    git checkout ${GIT_BRANCH} || exit 1
    cd ..
else
    cd ~/src
    git checkout ${GIT_BRANCH} && git pull || exit 1
    cd ..
fi

go run ~/src/${MAIN_FILE}

rm ~/.netrc ~/.wget-hsts