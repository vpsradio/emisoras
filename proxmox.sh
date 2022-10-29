wget https://raw.githubusercontent.com/extremeshok/xshok-proxmox/master/networking/network-configure.sh -c -O network-configure.sh && chmod +x network-configure.sh
./network-configure.sh && rm network-configure.sh
echo "zfs disco"
wget https://raw.githubusercontent.com/extremeshok/xshok-proxmox/master/zfs/createzfs.sh -c -O createzfs.sh && chmod +x createzfs.sh
./createzfs.sh disco2 /dev/sdb 
./createzfs.sh disco3 /dev/sdc
./createzfs.sh disco4 /dev/sdd
rm ./createzfs.sh
wget https://raw.githubusercontent.com/extremeshok/xshok-proxmox/master/zfs/xshok_slog_cache-2-zfs.sh -c -O xshok_slog_cache-2-zfs.sh && chmod +x xshok_slog_cache-2-zfs.sh
./xshok_slog_cache-2-zfs.sh disco2
./xshok_slog_cache-2-zfs.sh disco3
./xshok_slog_cache-2-zfs.sh disco4
rm  xshok_slog_cache-2-zfs.sh
apt-get install npd6

