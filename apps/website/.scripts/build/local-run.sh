#!/bin/sh

DHUB=""
TAG=latest
CNAME=local-my-website
IMAGE="${DHUB}${CNAME}:${TAG}"
PORT=4000

## Stop container by $CNAME & remove the $IMAGE
docker stop --time=20 $CNAME;
docker rm -f $CNAME;
docker image rm -f $IMAGE;

## Prebuild step
cp -f apps/website/public/robots.staging.txt apps/website/public/robots.txt
cp -f apps/website/.env.sample apps/website/.env

## Docker image build step
echo "building ${IMAGE}"
docker build -t $IMAGE -f apps/website/.scripts/build/Dockerfile .;

## Postbuild step

echo "starting container ${CNAME}"
docker run -d --name $CNAME -p $PORT:3000 $IMAGE
