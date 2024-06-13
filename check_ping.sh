#!/bin/bash

# Define the file containing server information
SERVER_FILE="$1"

# Check if the file exists
if [[ ! -f "$SERVER_FILE" ]]; then
  echo "Error: File '$SERVER_FILE' not found."
  exit 1
fi

# Color codes (modify as needed)
GREEN="\033[32m"  # Green for up
RED="\033[31m"    # Red for down
RESET="\033[0m"     # Reset color

# Loop through each line in the file
while IFS=',' read -r ip_address server_name; do
  # Check if ping is successful (return code 0 indicates success)
  if ping -c 1 -q "$ip_address" &> /dev/null; then
    status="${GREEN} UP ${RESET}"
  else
    status="${RED} DOWN ${RESET}"
  fi
  # Print server information with color-coded status
  echo -e "$server_name \t $ip_address ---- $status"
done < "$SERVER_FILE"

echo "-> Server ping check completed. <-"