#!/bin/bash
IP_ADDRESS=$(echo `ifconfig ens3 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`)
echo "The IP address to be configured is $IP_ADDRESS"

URL_API="https://10.230.4.13:8443/mgmt/tm/ltm/pool/"

PAYLOAD="'{ "name": "new-pool1", "members": [ { "name": "$IP_ADDRESS:3868", "description": "member5" } ] }'"

curl -k -u admin:iops123! -H "Content-Type: application/json" -X POST -d $PAYLOAD $URL_API
