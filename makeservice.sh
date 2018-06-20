#!/bin/bash

set -x
# Run as root in the same directory as the Dockerfile

# Create image
docker volume create bind

# Create service
docker service create \
            --mode global \
            --update-delay 0s \
            --update-failure-action="rollback" \
            --update-parallelism 1 \
            --dns 127.0.0.1 \
            --mount source=bind,target=/var/log/docker/bind/ \
            --mount source=bind,target=/var/docker/bind/ \
            --name "bind" \
            --publish published=53,target=53,protocol=udp \
            --publish published=53,target=53,protocol=tcp \
            192.168.10.150:5000/bind

#https://www.squidblacklist.org/downloads/dns-malicious.zone
#https://www.squidblacklist.org/downloads/dns-ads.zone
