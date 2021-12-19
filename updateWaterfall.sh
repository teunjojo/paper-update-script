#!/bin/bash
project=waterfall
version=1.18
build=$(curl -s https://papermc.io/api/v2/projects/$project/versions/$version | jq .builds[-1])
versionBuild=$version-$build

if ! [[ $versionBuild = $(cat versionBuild) ]]; then
  stty igncr
  echo -ne "Updating $project to version: $build ($version) ... "
  curl -s -o $project.jar https://papermc.io/api/v2/projects/$project/versions/$version/builds/$build/downloads/$project-$version-$build.jar
  echo $versionBuild > versionBuild
  echo Done
  stty -igncr
else
  echo "$project up to date!"
fi
