#!/bin/bash

# Check if the log directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR=$1
ARCHIVE_DIR="$LOG_DIR/archives"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_$TIMESTAMP.tar.gz"

# Create the archive directory if it doesn't exist
mkdir -p $ARCHIVE_DIR

# Compress the logs into a tar.gz file
tar -czvf $ARCHIVE_DIR/$ARCHIVE_NAME -C $LOG_DIR .

# Log the date and time of the archive
echo "Archived logs at $TIMESTAMP" >> $ARCHIVE_DIR/archive_log.txt

echo "Logs have been archived to $ARCHIVE_DIR/$ARCHIVE_NAME"
