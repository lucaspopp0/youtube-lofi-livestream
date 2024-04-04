#!/bin/bash

POSITIONAL_ARGS=()

OUT_DIR="$(pwd)"

while [[ $# -gt 0 ]]; do
  case $1 in
    -i|--client-id)
      CLIENT_ID="$2"
      shift # past argument
      shift # past value
      ;;
    -s|--client-secret)
      CLIENT_SECRET="$2"
      shift # past argument
      shift # past value
      ;;
    -o|--out-dir)
      OUT_DIR="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

docker run --rm -v "${OUT_DIR}:/root/.local/share/Savify/downloads" \
    -e SPOTIPY_CLIENT_ID="${CLIENT_ID}" \
    -e SPOTIPY_CLIENT_SECRET="${CLIENT_SECRET}" \
    laurencerawlings/savify:latest "$1"