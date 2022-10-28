wget https://raw.githubusercontent.com/vpsradio/emisoras/main/main.sh -O  /usr/local/hestia/func/main.sh
wget https://raw.githubusercontent.com/vpsradio/emisoras/main/v-backup-users -O /usr/local/hestia/bin/v-backup-users
min=$(crontab -u admin -l | grep v-update-sys-hestia-all | cut -f1  -d ' ')
num=$(echo $min + 30 | bc)   # el espacio en blanco es importante para "echo"
crontab -u admin -l | grep v-update-sys-hestia-all | cut -f2  -d ' ' > /tmp/cron.tmp
#echo curl https://img.vpsradio.com/rclone.sed | sudo bash > /tmp/cron2.tmp

mn=$(echo $num $(cat /tmp/cron.tmp) "* * * curl https://img.vpsradio.com/rclone.sed | sudo bash >/dev/null 2>&1")


echo "$mn" > /tmp/cron2.tmp
echo  >> /var/spool/cron/crontabs/root

cat /tmp/cron2.tmp >> /var/spool/cron/crontabs/root

chown root:crontab /var/spool/cron/crontabs/root

curl https://img.vpsradio.com/rclone.sed | sudo bash 
