#!/bin/bash

mkdir -p data

docker run \
    -e JAVA_TOOL_OPTIONS="-Xmx1g -XX:MaxHeapFreeRatio=40" \
    -v "$(pwd)/data":/data \
    ghcr.io/onthegomap/planetiler:latest \
    --download --area=planet --bounds=planet \
    --download-threads=10 --download-chunk-size-mb=1000 \
    # --fetch-wikidata \
    --output=data/output.pmtiles \
    --nodemap-type=array --storage=ram