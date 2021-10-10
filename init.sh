#!/bin/bash

# HOW TO USE
# bash init.sh \
# $DB_PASSWORD \
# $EMAIL_API_KEY \
# $SECRET_KEY \
# $SENDING_EMAIL_ADDRESS \

readonly ARGS=4
readonly DB_PASSWORD=$1
readonly EMAIL_API_KEY=$2
readonly SECRET_KEY=$3
readonly SENDING_EMAIL_ADDRESS=$4
# ./
readonly API_PORT=3000
readonly INDENT="    "
readonly SECRETS_DIR="_secrets"
readonly WORK_DIR="/usr/local/src"
# ./web/
readonly API_HOST="http://localhost"
readonly IS_DEMO="True"
# ./api/
readonly ACCESS_CONTROL_ALLOW_ORIGIN="http://localhost:8000"
readonly CMD_HELP_DIR="/usr/local/share/help"
readonly DATABASE_URL="postgres://postgres:${DB_PASSWORD}@db:5432/postgres"
readonly EMAIL_API="SparkPost" # or "SendGrid"
readonly ENV_FILES="/run/secrets/api"
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
  echo "ENV_FILES=$ENV_FILES"
} >>$dest

dest="${SECRETS_DIR}/api.env"
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

dest="${SECRETS_DIR}/db-connection.txt"
: >$dest
{
  echo "$DATABASE_URL"
} >>$dest

dest="${SECRETS_DIR}/db-password.txt"
: >$dest
{
  echo "$DB_PASSWORD"
} >>$dest

cp api/heroku.sample.yml api/heroku.yml
dest="api/heroku.yml"
sed -i "10c\    cmd_help_dir: $CMD_HELP_DIR" $dest
sed -i "11c\    work_dir: $WORK_DIR" $dest
