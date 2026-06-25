#!/bin/bash

VERSION="1.0.0"

echo -e "\n-----------------------------------------------"
echo "App_version: $VERSION"
echo "Hostname: $(hostname)"
echo "Date: $(TZ="Asia/Kathmandu" date "+%Y-%m-%d %H:%m:%S") NPT"

echo -e "\nSystem Information"
echo "Uptime: $(uptime -p)"
echo "OS_info: $(uname -smr)"
echo "CPU_cores:$(nproc)  load_average:$(uptime |  awk -F ":" '{print $NF}')"
echo "Memory: $(free -h | awk 'NR==2 {print "Total: " $2 "MB, Used: " $3}')"
echo "Storage: $(df -h / | awk 'NR==2 {print "Total: " $2 ", Used: " $3}')"

echo -e "-----------------------------------------------\n"
