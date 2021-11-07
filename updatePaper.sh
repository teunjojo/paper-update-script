#!/bin/bash
McVersion=1.17.1
if ! [[ $(curl -sb -H "Accept: application/json" "https://papermc.io/api/v1/paper/$version/latest/") = $(cat current.version) ]]; then
  curl -s -o paperclip.jar https://papermc.io/api/v1/paper/$McVersion/latest/download;
  curl -sb -H "Accept: application/json" "https://papermc.io/api/v1/paper/$version/latest/" > current.version
fi
