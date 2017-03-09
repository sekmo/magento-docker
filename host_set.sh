#!/bin/sh
ipaddr=$(head -n 1 /etc/hosts | awk '{print $1}')
hostnm=$(hostname)
echo "$ipaddr $hostnm.localdomain" >> /etc/hosts
