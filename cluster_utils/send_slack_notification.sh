#!/bin/bash

send_slack_notification() {
    assert_env_var_set "SLACK_WEBHOOK_URL"
    assert_env_var_set "SLACK_USER_ID"
    local message=$1
    local url=$SLACK_WEBHOOK_URL
    local text="<@$SLACK_USER_ID> $message"
    curl -X POST -H 'Content-type: application/json' --data "{'text':'${text}'}" $url
}


