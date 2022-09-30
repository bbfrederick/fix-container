#!/bin/bash

docker run \
    --rm \
    --mount type=bind,source=/Users/frederic/code/rapidtide/rapidtide/data/examples,destination=/data_out \
    -it fix-container:latest \
        bash -c "fix /data_in/results.ica /opt/fix/training_files/Standard.RData 20"
