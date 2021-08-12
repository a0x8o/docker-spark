#!/bin/bash

set -e

TAG=3.0.2-hadoop3.2

build() {
    NAME=$1
    IMAGE=a0x8o/spark-$NAME:$TAG
    cd $([ -z "$2" ] && echo "./$NAME" || echo "$2")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build -t $IMAGE .
    cd -
}

build base
build master
build worker
build submit
build java-template template/java
build scala-template template/scala
build python-template template/python
