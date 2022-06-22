#!/bin/bash
PROJ_ROOT=$(pwd)
cd "$PROJ_ROOT"/hello-world || exit
GOOS=linux go build -o "$PROJ_ROOT"/build/main main.go
cd "$PROJ_ROOT"/build || exit
zip -r "$PROJ_ROOT"/lambda.zip .
