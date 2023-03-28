#!/bin/bash

grep "/usr/local/hestia/data/users" /usr/local/maldetect.last/internals/functions  -i  > /dev/null 2>&1 
if [ $? -eq 0 ]; then
echo "\e[32m No edito configuacion \e[0m"
else [ $? -eq 1 ];
wget https://raw.githubusercontent.com/vpsradio/emisoras/main/malde -O /usr/local/maldetect.last/conf.maldet
wget https://raw.githubusercontent.com/vpsradio/emisoras/main/functions -O /usr/local/maldetect.last/internals/functions
wget https://raw.githubusercontent.com/vpsradio/emisoras/main/maldet.crond -O /etc/cron.daily/maldet

echo  "\e[31m Edito configuacion \e[0m"
fi 

grep "/usr/local/hestia/data/users" /usr/local/maldetect/internals/functions  -i  > /dev/null 2>&1 
if [ $? -eq 0 ]; then
echo "\e[32m No edito configuacion \e[0m"
else [ $? -eq 1 ];
wget https://raw.githubusercontent.com/vpsradio/emisoras/main/malde -O /usr/local/maldetect/conf.maldet
wget https://raw.githubusercontent.com/vpsradio/emisoras/main/functions -O /usr/local/maldetect/internals/functions
wget https://raw.githubusercontent.com/vpsradio/emisoras/main/maldet.crond -O /etc/cron.daily/maldet

echo  "\e[31m Edito configuacion \e[0m"
fi 
grep "hestia" /etc/cron.daily/maldet  -i  > /dev/null 2>&1 
if [ $? -eq 0 ]; then
echo "\e[32m No edito configuacion \e[0m"
else [ $? -eq 1 ];
wget https://raw.githubusercontent.com/vpsradio/emisoras/main/maldet.crond -O /etc/cron.daily/maldet

echo  "\e[31m Edito configuacion \e[0m"
fi 


exit
