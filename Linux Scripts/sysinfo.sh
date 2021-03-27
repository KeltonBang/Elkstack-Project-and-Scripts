Sysinfo

#!/bin/bash
echo "Todays Date is: "
date
echo "Uname: "
uname -m
echo "IP Address: "
 hostname -I | awk '{print $1}'
 echo "Hostname: "
uname -n
echo "DNS:  "
cat /etc/resolv.conf | grep "nameserver"
echo "Memory info: "
free mem
