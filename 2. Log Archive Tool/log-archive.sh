#!/bin/bash

set -e

function Archive {
	if [ -z "$1" ]; then
		echo "No directory argument provided"
		exit 1
	fi

	LOG_DIR=$1

	if [ ! -d "$LOG_DIR" ]; then
		echo "Error: '$LOG_DIR' is not a valid directory."
		exit 1
	fi

	ARCHIVE_DIR="$(pwd)/var/log"

	mkdir -p "$ARCHIVE_DIR"

	CURRENT_DATE=$(date +"%Y%m%d")
	CURRENT_TIME=$(date +"%H%M%S")

	ARCHIVE_NAME="logs_archive_${CURRENT_DATE}_${CURRENT_TIME}.tar.gz"
	ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

	tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

	echo "Archiving logs from $LOG_DIR to $ARCHIVE_PATH"
}

Archive $@
