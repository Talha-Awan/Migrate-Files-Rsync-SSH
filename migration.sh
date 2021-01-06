#!/bin/bash

cd /var/www/html
wp db export --allow-root
cd ..
echo "Input TAR file name (abc.tar.gz): "
read name
tar -zcf $name -P $1
destination_user=$2
destination_ip=$3
destination_path=$4
destination_port=$5
rsync -a /var/www/$name $destination_user@$destination_ip:$destination_path -e "ssh -p $destination_port"
