#!/usr/bin/env bash

# sdk [plugin/'' for wso2sdk core] [command] [param1] [param2] [param3] [param4] [param5]
function sdk() {
  local unknown="$1"
  local plugin command param1 param2 param3 param4 param5
  local CMD_TARGET CMD_FOUND
  local final_result=0

  # check core functions
  CMD_TARGET="${WSO2SDK_DIR}/bin/wso2sdk-${unknown}.sh"
  if [ -f "$CMD_TARGET" ]; then
    CMD_FOUND="$CMD_TARGET"
    plugin="wso2sdk"
  fi

  # check plugins
  CMD_TARGET="${WSO2SDK_DIR}/plugins/${unknown}/init.sh"
  if [ -f "$CMD_TARGET" ]; then
    CMD_FOUND="$CMD_TARGET"
    plugin="$unknown"
  fi

  # plugin or core function not found
  if [ -z "$CMD_FOUND" ]; then
    __wso2sdk_echo_red "Stop! $unknown is not a plugin or core function"
    return 1
  fi

  # assign command and parameters
  if [ "$plugin" = "wso2sdk" ]; then
    # i.e: [sdk] command param1 param2 param3 ...
    command="$1"
    param1="$2"
    param2="$3"
    param3="$4"
    param4="$5"
    param5="$6"
  else
    # i.e: [sdk] [plugin] command param1 param2 param3 ...
    # TODO: ERROR - param1 is not properly getting passed to the plugin
    command="$2"
    param1="$3"
    param2="$4"
    param3="$5"
    param4="$6"
    param5="$7"
  fi

  __wso2sdk_debug "Executing sdk command with params plugin=$plugin command=$command param1=$param1 param2=$param2 param3=$param3 param4=$param4 param5=$param5"

  # execute the command
  __"$plugin"_"$command" "$param1" "$param2" "$param3" "$param4" "$param5"
  final_result=$?

  return $final_result
}
