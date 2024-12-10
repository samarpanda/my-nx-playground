#!/bin/sh

export LC_ALL=en_US.UTF-8
cd /

cd app/
export $(grep -v '^#' .env | xargs)
export NODE_ENV=production
export DEPLOY_ENV=production
export NEXT_TELEMETRY_DISABLE=1
export HOST="0.0.0.0"
export PORT=3000

node apps/website/server.js
