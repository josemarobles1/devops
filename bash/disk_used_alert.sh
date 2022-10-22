#!/bin/bash
# Parse df selected output
USED_NUMBER=$(df -h | grep da | grep G |awk '{print $5}' |sed 's/\%//')
if [ $USED_NUMBER -gt 90 ]; then
        # Create message without spaces
        # Post message
        echo $USED_NUMBER
        curl -X POST --data-urlencode "payload={\"channel\":\"#services-down\",\"username\":\"webhookbot\",\"text\":\"ALERTA <@USER_ID|call> El disco del server $USER_DEV, esta al $USED_NUMBER% de su uso.\",}" https://hooks.slack.com/services/
fi
