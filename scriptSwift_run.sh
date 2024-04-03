#!/bin/bash

# PROMPT="a constellation of thousands of cats in low earth orbit"
PROMPT="healthy boy eating broken glass for breakfast"


# environment variables for paths
TIMESTAMP=$(date +%Y%m%d)

OUTPUT_PATH=$(echo $PROMPT | tr ' ' '_')
OUTPUT_PATH=$(echo $OUTPUT_PATH | cut -c 1-30)
OUTPUT_PATH="./output/${TIMESTAMP}_${OUTPUT_PATH}/"
if [ ! -d "$OUTPUT_PATH" ]; then
  mkdir -p "$OUTPUT_PATH"
fi

RESOURCE_PATH="./models/Resources/"


# run the command with environment variables
swift run StableDiffusionSample \
    "$PROMPT" \
    --resource-path "$RESOURCE_PATH" \
    --output-path "$OUTPUT_PATH" \
    --compute-units cpuAndGPU \
    --xl