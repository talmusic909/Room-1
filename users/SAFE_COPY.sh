#!/bin/bash

LOG_FILE="pingstorm.log"

#logging function
log_action() {
	local module_name="$1"
	local message="$2"
	echo "$(date '+%Y -%m -%d %H %M %S') [$module_name] $message" >> "$LOG_FILE"
}

#exist check
read -p "Enter the source file: " source_file
echo "$source_file"
read -p "ENTER des: " des
echo "$des"

	if [[ ! -f "$source_file" ]]; then
		log_action "FILE_CHECK" "Eror: Source file '$source_file' does not exist"
		echo "Error: Source file '$source_file' does not exist"
		exit 1
	fi

	 if [[ ! -d "$des" ]]; then
        log_action "DEST_CHECK" "Eror: destination dir '$des'"
        echo "error"
        exit 1
        fi

#cal
source_size=$(du -sb "$source_file" | awk '{print $1}')
available_space=$(df --output=avail "$des" | tail -1 | awk '{print $1}')
available_space=$((available_space * 1024))

log_action "SPACE_CHECK" "Source Size: $source_size bytes, Available space: $available_space bytes"

#check available space
	if [[ $source_size -gt $available_space ]]; then
	log_action "SPACE_CHECK" "Not enough space available in $des"
	echo "SPACE_CHECK" "Not enough space available in $des"
	exit 1
	fi
#copy file
	cp "$source_file" "$des"
	if [[ $? -eq 0 ]]; then
	log_action "FILE_COPY" "File '$source_file' copied successfully to '$des'
	echo "File copied successfully"
else
	log_action "FILE_COPY" "Error copying file '$source_file' to '$des'
	echo "Error copying file"
	exit 1
	fi

log_action "COMPLETION" "Script execution completed"
