#!/bin/bash

/usr/sbin/named -4 -n 4 -U 4 -p BIND_PORT -u BIND_EFFECTIVE_USER -c BIND_CONF -g
