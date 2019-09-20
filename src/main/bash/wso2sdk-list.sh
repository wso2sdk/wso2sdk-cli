#!/usr/bin/env bash

function __wso2sdk_list() {
  local product

  product="$1"

  if [ -z "$product" ]; then
    #TODO: list all products from API
    __wso2sdk_echo_red "TODO: list all products from API"
  else
    #TODO: list versions of the product
    __wso2sdk_echo_red "TODO: list versions for the product: $product"
  fi
}