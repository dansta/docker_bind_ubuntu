#!/bin/bash

# Run as root in the same directory as the Dockerfile

# Create image
docker build -t bind:0.0.100 .

# Create east-west and multicast network
docker network create \
            --opt encrypted \
            --subnet 10.0.0.0/24 \
            --subnet 224.0.0.0/24 \
            --driver overlay \
            bind 

# Create volume for bind
docker volume create bind

# Create service
docker service create \
            --mode global \
            --update-delay 60s \
            --update-parallelism 1 \
            --dns 127.0.0.1
            --network bind \
            --add-host="multicast-bind:224.0.0.2" \
            --mount source=bind,target=/var/log/docker/bind/ \
            --mount source=bind,target=/var/docker/bind/ \
            --name "bind" \
            --publish published=53,target=53 \
            bind:0.0.100

