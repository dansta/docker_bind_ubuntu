## docker_bind_ubuntu

## Resolver/cache/validating bind9 in an ubuntu based docker container

Installs bind 9 with transient packages to allow dnssec

I made this solely because alpine arm on docker does not build. When alpine starts working again I might stop maintaining this build.



# Files
* makaservice.sh creates a service within a swarm that is accessible from scratch
* bind/named.conf can be safely edited. Anything that begins with keyword BIND_ will be replaced on build by replace.py. Dockerfile contains the variables or they can be inserted as arguments during build
* wrappur.sh exists solely as added complexity to launch that Dockerfiles are bad at.

## Usage
# Build:
  docker build -t bind:0.0.1 <path>/Dockerfile
# Run:
  docker run -ti -p 53:53/tcp -p 53:53/udp bind:0.0.1
# Service:
  makeservice.sh
