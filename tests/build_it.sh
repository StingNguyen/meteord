#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "nguyenminhtienitvn/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "nguyenminhtienitvn/meteord:node-${NODE_VERSION}-base" nguyenminhtienitvn/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "nguyenminhtienitvn/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "nguyenminhtienitvn/meteord:node-${NODE_VERSION}-onbuild" nguyenminhtienitvn/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "nguyenminhtienitvn/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "nguyenminhtienitvn/meteord:node-${NODE_VERSION}-devbuild" nguyenminhtienitvn/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "nguyenminhtienitvn/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "nguyenminhtienitvn/meteord:node-${NODE_VERSION}-binbuild" nguyenminhtienitvn/meteord:binbuild
