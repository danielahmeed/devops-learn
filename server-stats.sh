#!/bin/bash

# Server Performance Analysis Script
# Usage: ./server-stats.sh

echo "==========================================="
echo "       Server Performance Stats"
echo "==========================================="

# 1. Total CPU Usage
echo ""
echo "-------------------------------------------"
echo "Total CPU Usage:"
echo "-------------------------------------------"
# Use top to get CPU load (idle time), then subtract from 100 to get usage
# -b: batch mode, -n1: one iteration
cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print $1}')
cpu_usage=$(awk "BEGIN {print 100 - $cpu_idle}")
echo "CPU Usage: $cpu_usage%"

# 2. Total Memory Usage
echo ""
echo "-------------------------------------------"
echo "Total Memory Usage:"
echo "-------------------------------------------"
# free -m: show memory in MB
free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%) / Total: %sMB (Free: %sMB)\n", $3, $3*100/$2, $2, $4}'

# 3. Total Disk Usage
echo ""
echo "-------------------------------------------"
echo "Total Disk Usage:"
echo "-------------------------------------------"
# df -h: human readable formats
# exclude tmpfs and devtmpfs for cleaner output
df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop' | awk '{ print $5 " used on " $1 " (Size: " $2 ", Used: " $3 ", Free: " $4 ")" }'

# 4. Top 5 Processes by CPU Usage
echo ""
echo "-------------------------------------------"
echo "Top 5 Processes by CPU Usage:"
echo "-------------------------------------------"
# ps command to list processes, sort by cpu, head for top 5
ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6

# 5. Top 5 Processes by Memory Usage
echo ""
echo "-------------------------------------------"
echo "Top 5 Processes by Memory Usage:"
echo "-------------------------------------------"
# ps command to list processes, sort by memory, head for top 5
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6

# Stretch Goals: Additional Stats
echo ""
echo "==========================================="
echo "       Additional Information"
echo "==========================================="

# OS Version
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"

# Uptime
echo "Uptime: $(uptime -p)"

# Load Average
echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }' | xargs)"

# Logged in Users
echo "Logged in Users: $(who | wc -l)"

echo "==========================================="
echo "Analysis Complete."
echo "==========================================="
