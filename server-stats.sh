#!/bin/bash

# Function to get total CPU usage
get_cpu_usage() {
    echo "Total CPU Usage:"
    top -bn1 | grep "Cpu(s)" | \
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
    awk '{print 100 - $1"%"}'
}

# Function to get total memory usage
get_memory_usage() {
    echo "Total Memory Usage:"
    free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%), Free: %sMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2}'
}

# Function to get total disk usage
get_disk_usage() {
    echo "Total Disk Usage:"
    df -h | awk '$NF=="/"{printf "Used: %dGB (%s), Free: %dGB (%s)\n", $3, $5, $4, $5}'
}

# Function to get top 5 processes by CPU usage
get_top_cpu_processes() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
}

# Function to get top 5 processes by memory usage
get_top_memory_processes() {
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
}

# Stretch goal: Additional stats
get_additional_stats() {
    echo "OS Version:"
    lsb_release -a
    echo "Uptime:"
    uptime
    echo "Load Average:"
    cat /proc/loadavg
    echo "Logged in Users:"
    who
    echo "Failed Login Attempts:"
    grep "Failed password" /var/log/auth.log | wc -l
}

# Main function to call all other functions
main() {
    get_cpu_usage
    echo ""
    get_memory_usage
    echo ""
    get_disk_usage
    echo ""
    get_top_cpu_processes
    echo ""
    get_top_memory_processes
    echo ""
    get_additional_stats
}

# Execute main function
main
