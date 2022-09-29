#!/bin/bash

docker run \
    --rm \
    --mount type=bind,source=/Users/frederic/code/rapidtide/rapidtide/data/examples,destination=/data \
    -it fix-container:latest \
    gradunwarp 
