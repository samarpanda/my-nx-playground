#!/bin/sh

DHUB=""
TAG=latest
CNAME=local-my-website
IMAGE="${DHUB}${CNAME}:${TAG}"

docker stop --time=20 $CNAME;
docker rm -f $CNAME;
docker image rm -f $IMAGE;
