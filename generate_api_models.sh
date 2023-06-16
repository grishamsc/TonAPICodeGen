#!/bin/sh

SCRIPT_PATH="${BASH_SOURCE:-$0}"
DIR_PATH="$(dirname "${SCRIPT_PATH}")"
OUTPUT_PATH="${DIR_PATH}/../Source/TonAPI/Generated"

if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which create-api > /dev/null; then
  create-api generate ${DIR_PATH}/openapi.yml \
  --config-option module=TonAPI \
  --config ${DIR_PATH}/.create-api.yaml \
  --output ${OUTPUT_PATH} \
  --clean

else
  echo "warning: create-api not installed, download from https://github.com/CreateAPI/CreateAPI"
fi
