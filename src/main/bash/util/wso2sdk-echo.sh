#!/usr/bin/env bash

function __wso2sdk_echo() {
  if [[ "$wso2sdk_colour_enable" == 'false' ]]; then
    echo -e "$2"
  else
    echo -e "\033[1;$1$2\033[0m"
  fi
}

function __wso2sdk_echo_red() {
  __wso2sdk_echo "31m" "$1"
}

function __wso2sdk_echo_yellow() {
  __wso2sdk_echo "33m" "$1"
}

function __wso2sdk_echo_green() {
  __wso2sdk_echo "32m" "$1"
}

function __wso2sdk_debug() {
  __wso2sdk_echo_yellow "$1"
}
