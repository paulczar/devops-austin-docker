#!/bin/sh

MYSQL=$(docker run -d -p 3306 paulczar/mysql mysqld_safe)

MYSQL_IP=$(docker inspect $MYSQL | grep IPAd | awk -F'"' '{print $4}')

MYSQL_PORT=$(docker port $MYSQL 3306)

echo Container ID = $MYSQL
echo IP Address   = $MYSQL_IP
echo Public Port  = $MYSQL_PORT

 sleep 2  

 echo "select now() \G" | mysql -uroot -proot -h 127.0.0.1 -P $MYSQL_PORT

 echo "select now() \G" | mysql -uroot -proot -h $MYSQL_IP
