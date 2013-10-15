#!/bin/bash

echo "docker build -t demo/chef-apache ."

cd docker301

docker build -t demo/chef-apache .

echo "docker run -d -p 8085:80 demo/chef-apache"
docker run -d -p 8085:80 demo/chef-apache

cd ..
