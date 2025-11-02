#! /bin/bash

echo -e "My First Bash Script\n"

echo -e "\n\nTotal CPU usage"
top -i -n 5 | grep "Cpu(s)"

echo -e "\n\nTotal memory usage (Free vs Used including percentage)"
#cat /proc/meminfo
free -h

echo -e "\n\nTotal disk usage (Free vs Used including percentage)"
df -h --output=source,size,used,avail,pcent,target | column -t

echo -e "\n\nTop 5 processes by CPU usage"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo -e "\n\nTop 5 processes by memory usage"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
