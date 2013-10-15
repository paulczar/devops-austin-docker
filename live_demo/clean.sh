#!/bin/sh

echo "Killing any running containers:"
docker kill `docker ps  | awk '{print $1}' | sed -e '1d' | xargs`
echo "Delete all containers:"
docker rm `docker ps -a | awk '{print $1}' | sed -e '1d' | xargs`

