#!/bin/bash

set -x
set -e

echo "Preparing container..."

if [ "$VERBOSE" == "true" ]; then
  VERB="-v"
fi

echo "Starting Raspotify..."
/usr/bin/librespot $VERB --name "$SPOTIFY_NAME" -u "$USERNAME" -p "$PASSWORD" $BACKEND $DEVICE -AP --disable-audio-cache 
