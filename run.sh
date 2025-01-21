#! /bin/bash

set -e

CONTAINER_NAME=botsgeek-yocto-builder:0.1

docker run -v `pwd`:`pwd` -it $CONTAINER_NAME /bin/bash

