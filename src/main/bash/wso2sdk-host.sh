#!/usr/bin/env bash

function __wso2sdk_host() {
  local command

  command="$1"

  if [ "$command" = "add" ]; then
    __wso2sdk_echo_red "TODO: add host params $2 $3 $4 $5 $6"
  elif [ "$command" = "remove" ]; then
    __wso2sdk_echo_red "TODO: remove host"
  elif [ "$command" = "list" ]; then
    __wso2sdk_echo_red "TODO: list hosts"
  fi

}
