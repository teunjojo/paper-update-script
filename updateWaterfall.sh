#!/bin/bash
McVersion=1.17
if ! [[ $(curl -sb -H "Accept: application/json" "https://papermc.io/api/v1/waterfall/$version/latest/") = $(cat current.version) ]]; then
curl -s -o waterfall.jar https://papermc.io/api/v1/waterfall/$McVersion/latest/download;
curl -sb -H "Accept: application/json" "https://papermc.io/api/v1/waterfall/$version/latest/" > current.version
fi
