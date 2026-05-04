#!/bin/bash

INPUT_URL=$1
TEMP_FILE="temp_video.mp4"

echo "Downloading video..."

# download from cloud link
curl -L "$INPUT_URL" -o $TEMP_FILE

FILENAME=$(basename "$TEMP_FILE")
NAME="${FILENAME%.*}"

echo "Processing 360 video..."

ffmpeg -i "$TEMP_FILE" -vf "v360=input=equirect:output=equirect" \
-c:v libx264 -crf 18 -preset fast "output/${NAME}_processed.mp4"

echo "Done. Check output folder."
