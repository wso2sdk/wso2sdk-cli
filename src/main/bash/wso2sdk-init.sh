#!/usr/bin/env bash

# wso2sdk version
# this token will be replaced by groovy
if [ -z "$WSO2SDK_VERSION" ]; then
  export WSO2SDK_VERSION="@WSO2SDK_VERSION@"
fi

# wso2sdk products api
# this token will be replaced by groovy
if [ -z "$WSO2SDK_PRODUCTS_API" ]; then
  export WSO2SDK_PRODUCTS_API="@WSO2SDK_PRODUCTS_API@"
fi

if [ -z "$WSO2SDK_DIR" ]; then
  export WSO2SDK_DIR="$HOME/wso2sdk"
fi

if [ -z "$WSO2SDK_PRODUCTS_DIR" ]; then
  export WSO2SDK_PRODUCTS_DIR="$WSO2SDK_DIR/products"
fi

if [ -z "$WSO2SDK_PLUGINS_DIR" ]; then
  export WSO2SDK_PLUGINS_DIR="WSO2SDK_DIR/plugins"
fi

# source the config file
if [ -f "$WSO2SDK_DIR/config" ]; then
  source "$WSO2SDK_DIR/config"
fi

# source internal script files
OLD_IFS="$IFS"
IFS=$'\n'
scripts=($(find "${WSO2SDK_DIR}/bin" -type f -name 'wso2sdk-*'))
for script in "${scripts[@]}"; do
  if [ "$script" != "$0" ]; then
    source "$script"
  fi
done
IFS="$OLD_IFS"
unset scripts script

# initialize plugins
if [ -d "$WSO2SDK_PLUGINS_DIR" ]; then
  OLD_IFS="$IFS"
  IFS=$'\n'
  plugin_dirs=($(find "$WSO2SDK_PLUGINS_DIR" -type d -mindepth 1 -maxdepth 1))
  for plugin_dir in "${plugin_dirs[@]}"; do
    plugin_init_file="${plugin_dir}/init.sh"

    if [ -f $plugin_init_file ]; then
      source "$plugin_init_file"
    fi
  done
  IFS="$OLD_IFS"
  unset plugin_dirs plugin_dir plugin_init_file
fi

# TODO: set home dir for installed products
# link products
