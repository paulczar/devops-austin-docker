# DOCKER-VERSION 0.5.3
FROM ubuntu
MAINTAINER Paul Czarkowski "paul@paulcz.net"

ADD https://s3-us-west-2.amazonaws.com/paulcz-packages/kibana3_amd64.deb /tmp/kibana3_amd64.deb

RUN dpkg -i /tmp/kibana3_amd64.deb

CMD ["/opt/kibana3/embedded/bin/runsvdir-start"]