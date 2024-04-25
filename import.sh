#!/bin/bash

# Get the full path to the script file
script_path="${BASH_SOURCE[0]}"

# Resolve symlinks
while [ -h "$script_path" ]; do
  script_dir="$( cd -P "$( dirname "$script_path" )" >/dev/null 2>&1 && pwd )"
  script_path="$(readlink "$script_path")"
  [[ $script_path != /* ]] && script_path="$script_dir/$script_path"
done

# Get the directory containing the script
script_dir="$( cd -P "$( dirname "$script_path" )" >/dev/null 2>&1 && pwd )"

# Import cluster utils
echo "Importing cluster utils from $script_dir"
source "$script_dir/env.sh"
source "$script_dir/cluster_utils/assert_env_var_set.sh"
source "$script_dir/cluster_utils/send_slack_notification.sh"
echo "Cluster utils imported from $script_dir"
