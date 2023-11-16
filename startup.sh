#!/bin/bash

echo "machine ${GIT_SERVER} login ${GIT_USERNAME} password ${GIT_PASSWORD}" >> ~/.netrc

GOMODCACHE=~/.cache/go-pkg

if [ ! -d "src" ]; then
    git clone ${GIT_REPO} src
    cd src
    git checkout ${GIT_BRANCH} || exit 1
    cd ..
else
    cd src
    git checkout ${GIT_BRANCH} && git pull || exit 1
    cd ..
fi

cd src
go build -o ../server ${MAIN_FILE} || exit 1
cd ..
./server

if [ -f "~/.netrc" ]; then
    rm ~/.netrc
fi
if [ -f "~/.wget-hsts" ]; then
    rm ~/.wget-hsts
fi