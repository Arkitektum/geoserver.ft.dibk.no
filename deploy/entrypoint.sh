#!/bin/bash

cd $GEOSERVER_DATA_DIR

find . -name "*.sld" -exec sh -c 'envsubst < "$1" > "$1.tmp" && mv "$1.tmp" "$1"' _ {} \;

bash /opt/startup.sh