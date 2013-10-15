#!/bin/bash

cd docker203


echo "docker build -t demo/znc ."

docker build -t demo/znc .

echo "docker run -d -e ZNC_USER=paultest -e ZNC_PASS=paultest \n
      -p 6667 -u znc demo/znc start-znc"

ID=$(docker run -d -e ZNC_USER=paultest -e ZNC_PASS=paultest \
      -p 6667 -u znc demo/znc start-znc)

sleep 1

echo "docker logs $ID"

docker logs $ID

cd ..    