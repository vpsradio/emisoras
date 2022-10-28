#!/bin/bash

grep "#rclone" /usr/local/hestia/func/main.sh  -i  > /dev/null 2>&1 
if [ $? -eq 0 ]; then
echo -e "\e[32m No edito configuacion \e[0m"
else [ $? -eq 1 ];
sed -i 's%`cat /proc/cpuinfo | grep processor | wc -l`%60\ \n#rclone%g' "/usr/local/hestia/func/main.sh" >/dev/null 2>&1
echo -e "\e[31m Edito configuacion \e[0m"
fi 



grep "#rclone" /usr/local/hestia/bin/v-backup-users  -i  > /dev/null 2>&1 
if [ $? -eq 0 ]; then
echo -e "\e[32m No edito configuacion \e[0m"
else [ $? -eq 1 ];
sed -i 's/exit/#rclone\ \n/g'  /usr/local/hestia/bin/v-backup-users
echo '/opt/rclone.sh' >>  /usr/local/hestia/bin/v-backup-users
echo 'email=$(grep CONTACT "$HESTIA/data/users/admin/user.conf" |cut -f 2 -d \')' >>  /usr/local/hestia/bin/v-backup-users
echo 'cat /var/log/rclone.log |$SENDMAIL -s "OneDrive" "$email" "yes" > /dev/null 2>&1' >>  /usr/local/hestia/bin/v-backup-users
echo 'exit' >>  /usr/local/hestia/bin/v-backup-users.back
echo -e "\e[31m Edito configuacion \e[0m"
fi 

exit
