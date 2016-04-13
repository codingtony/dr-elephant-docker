#!/bin/bash

db_url=dr-elephant-mysql
db_name=drelephant
db_user=root
db_password="drelephant"

until mysql -h "$db_url" -u$db_user -p$db_password -D$db_name -e'show tables;'; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done


#db.default.url="jdbc:mysql://localhost/playdb"
#db.default.username=playdbuser
#db.default.password="a strong password"



exec "$@"
