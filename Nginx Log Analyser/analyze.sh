#!/bin/bash


if [ -z "$1" ]; then
  echo "Usage: $0 <nginx-access-log-file>"
  exit 1
fi

LOG_FILE=$1


echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -5


echo -e "\nTop 5 most requested paths:"
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -5


echo -e "\nTop 5 response status codes:"
awk '{print $9}' $LOG_FILE | sort | uniq -c | sort -nr | head -5


echo -e "\nTop 5 user agents:"
awk -F\" '{print $6}' $LOG_FILE | sort | uniq -c | sort -nr | head -5
