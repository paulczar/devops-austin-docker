#!/bin/bash

echo "docker build -t demo/kibana ."
docker build -t demo/kibana .

mkdir -p {stats,sv,init,service,log}
ls stats/* > /dev/null && rm -f stats/* || echo 
BASE=$(pwd)

echo "docker run -d -p 8089:80 -p 8443:443 \
  -v $BASE/sv:/opt/kibana3/sv \
  -v $BASE/init:/opt/kibana3/init \
  -v $BASE/service:/opt/kibana3/service \
  -v $BASE/log:/var/log/kibana \
  paulczar/kibana"

SHORT_ID=$(docker run -d -p 8089:80 -p 8443:443 \
  -v $BASE/sv:/opt/kibana3/sv \
  -v $BASE/init:/opt/kibana3/init \
  -v $BASE/service:/opt/kibana3/service \
  -v $BASE/log:/var/log/kibana \
  demo/kibana)

LONG_ID=$(docker inspect ${SHORT_ID} | grep ID | awk '{print $2}' | sed 's/"//g' | sed 's/,//g')

echo "Linking stats data"
for DIR in $(grep cgroup /proc/mounts | awk '{print $2}' | sed "1 d" | xargs)
do
  STAT=$(basename $DIR)
  ln -s $DIR/lxc/$LONG_ID stats/${STAT}
done
