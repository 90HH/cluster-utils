#!/bin/bash

# Function to assert that an environment variable is not empty
assert_env_var_set() {
    local var_name=$1
    local var_value=$(eval echo "\$$var_name")

    if [ -z "$var_value" ]; then
        echo "Error: $var_name is required but not set or is empty."
        exit 1
    else
        echo "$var_name is set to $var_value"
    fi
}

