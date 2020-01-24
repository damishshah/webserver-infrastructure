#!/bin/bash

COMPOSE="/usr/local/bin/docker-compose"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

$COMPOSE up -d
line="0 0 */3 * * $SCRIPTPATH/scripts/ssl_renew.sh"
(crontab -u ec2-user -l; echo "$line" ) | crontab -u ec2-user -