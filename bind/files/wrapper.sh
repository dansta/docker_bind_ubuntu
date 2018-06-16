#!/bin/bash

# initial download
wget -O /etc/named/mal.zone https://www.squidblacklist.org/downloads/dns-malicious.zone
wget -O /etc/named/ads.zone https://www.squidblacklist.org/downloads/dns-ads.zone

# statup schedule
mkdir -p /etc/cron.weekly/
cat /downloadblacklists > /etc/cron.weekly/downloadblacklists
chmod ugo+x /etc/cron.weekly/downloadblacklists


# start the daemon
/usr/sbin/named -4 -n 4 -U 4 -p BIND_PORT -u BIND_EFFECTIVE_USER -c BIND_CONF -g
