#!/bin/bash
cd /home/container || exit 1

# Configure colors
PURPLE='\033[38;5;183m'
GREEN='\033[38;5;46m'
RED='\033[38;5;196m'
RESET_COLOR='\033[0m'

# Print Current Java Version
java -version

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "STARTUP /home/container: ${MODIFIED_STARTUP}"

# Run the Server
# shellcheck disable=SC2086
cat << 'EOF'
    __ __ _          _                
   / //_/(_)      __(_)               
  / ,<  / / | /| / / /                
 / /| |/ /| |/ |/ / /                 
/_/ |_/_/_|__/|__/_/ __  _            
   / / / /___  _____/ /_(_)___  ____ _
  / /_/ / __ \/ ___/ __/ / __ \/ __ `/
 / __  / /_/ (__  ) /_/ / / / / /_/ / 
/_/ /_/\____/____/\__/_/_/ /_/\__, /  
                             /____/   
EOF
echo -e "========================================================================================================"
echo -e "${GREEN}Welcome to Kiwi Hosting${RESET_COLOR}! Need help? Reach us on Discord: discord.gg/7TqnX8qpjB "
echo -e "========================================================================================================"
echo -e "${GREEN} booting up your server"
eval "${MODIFIED_STARTUP}"
echo -e "${RED}Your server is now off${RESET_COLOR}"
