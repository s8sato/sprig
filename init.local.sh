#!/bin/bash

readonly ARGS=0
readonly DB_PASSWORD="postgres"
readonly EMAIL_API_KEY="&=="
readonly SECRET_KEY="11112222333344445555666677778888"
readonly SENDING_EMAIL_ADDRESS="mail@domain.com"
# ./
readonly API_PORT=3000
readonly INDENT="    "
# ./web/
readonly API_HOST="http://localhost"
readonly IS_DEMO="False"
# ./api/
readonly ACCESS_CONTROL_ALLOW_ORIGIN="http://localhost:8000"
readonly CMD_HELP_DIR="src/handlers/app/_cmd_help"
readonly DATABASE_URL="postgres://postgres:${DB_PASSWORD}@localhost:5432/sprig_my"
readonly EMAIL_API="SparkPost" # or "SendGrid"
readonly IS_CROSS_ORIGIN="true"
readonly SENDER_NAME="Sprig"

if [ $# -ne $ARGS ]; then
  {
    echo "$# arguments found."
    echo "Specify exactly $ARGS arguments."
  } 1>&2
  exit 1
fi

dest=".env"
: >$dest
{
  echo "API_PORT=$API_PORT"
  echo "CMD_HELP_DIR=$CMD_HELP_DIR"
  echo "SECRETS_DIR=$SECRETS_DIR"
  echo "WORK_DIR=$WORK_DIR"
} >>$dest

dest="web/src/Config.elm"
: >$dest
{
  echo "module Config exposing (..)"
  echo "epBase = \"${API_HOST}:${API_PORT}/api\""
  echo "isDemo = $IS_DEMO"
  echo "indent = \"$INDENT\""
} >>$dest

dest="api/.env"
: >$dest
{
  echo "ACCESS_CONTROL_ALLOW_ORIGIN=$ACCESS_CONTROL_ALLOW_ORIGIN"
  echo "CMD_HELP_DIR=$CMD_HELP_DIR"
  echo "DATABASE_URL=$DATABASE_URL"
  echo "EMAIL_API=$EMAIL_API"
  echo "EMAIL_API_KEY=$EMAIL_API_KEY"
  echo "INDENT='$INDENT'"
  echo "IS_CROSS_ORIGIN=$IS_CROSS_ORIGIN"
  echo "PORT=$API_PORT"
  echo "SECRET_KEY=$SECRET_KEY"
  echo "SENDER_NAME='$SENDER_NAME'"
  echo "SENDING_EMAIL_ADDRESS=$SENDING_EMAIL_ADDRESS"
} >>$dest
