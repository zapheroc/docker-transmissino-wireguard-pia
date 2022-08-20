#!/bin/bash

echo "Telling the transmission session to shut down cleanly"
pid=$(pidof transmission-daemon)
if [ ! -z "$TRANSMISSION_RPC_USERNAME" ] && [ ! -z "$TRANSMISSION_RPC_PASSWORD" ]; then
  /usr/bin/transmission-remote -n "$TRANSMISSION_RPC_USERNAME":"$TRANSMISSION_RPC_PASSWORD" --exit
else
  /usr/bin/transmission-remote --exit
fi
# Terminate when the transmission-daemon process dies
tail --pid="${pid}" -f /dev/null