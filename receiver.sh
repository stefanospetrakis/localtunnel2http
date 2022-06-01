#!/bin/sh

# This file will receive the name of a container and a port
# will expose them via localtunnel
# and return the exposed public URL

# Sample URL => curl 'http://172.17.0.1:49191/command?port=49158&host=172.17.0.1'
# for a service exposing web port 49158;
# this will become available as (or similar to)
# https://open-views-share-213-55-220-47.loca.lt

pm2  >/dev/null start --wait-ready --listen-timeout 3000 lt -- --port $v_port --local-host $v_host
tail -1 /root/.pm2/logs/lt-out.log | grep -o "https.*"
