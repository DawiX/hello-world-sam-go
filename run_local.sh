#!/bin/bash
read -rp "Build before? (y/n) [n]: " BUILD_COND
BUILD_COND=${BUILD_COND:-n}

PROFILE="my-dev"
REGION="eu-west-1"
if [ "$BUILD_COND" == "y" ] || [ "$BUILD_COND" = "yes" ]; then
    sam build
fi
sam local invoke HelloWorldFunction --event events/event.json -n events/env.json --profile $PROFILE --region $REGION
