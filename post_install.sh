#!/bin/sh

# set the data location
DATA_LOCATION="/app-data/radarr"

# create the data location
mkdir -p $DATA_LOCATION

# make "radarr" the owner of the data location
chown -R radarr:radarr $DATA_LOCATION

# make "radarr" the owner it's directory
chown -R radarr:radarr /usr/local/share/radarr

# we need write permission to be able to write plugins update.
chmod 755 /usr/local/radarr

# enable radarr to start at boot
sysrc "radarr_enable=YES"

# set the radarr data directory
sysrc "radarr_data_dir=/app-data/radarr"

# start the service
service radarr start
