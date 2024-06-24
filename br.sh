#!/bin/bash

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

#######################################################

echo -ne '\033c'
trap RM_HT_FOLDER SIGINT SIGQUIT SIGTSTP
echo ""
sleep 0.1
echo -e "${Cyan}    +${Yellow}--------------------------------------------------------------------------------------------------------------------------${Cyan}+${Yellow}"
sleep 0.1
echo -e "                                     |${BRed} Online Browser ${BYellow}by${BGreen} Hamza Hammouch${Cyan} powered by${BPurple} linuxserver${Yellow} |"
sleep 0.1
echo -e "                                     ${Cyan}+${Yellow}--------------------------------------------------------${Cyan}+"
sleep 0.1

#######################################################

# Function to remove temporary folder on exit
RM_HT_FOLDER() {
  rm -rf /tmp/ht
}

# Function to install NoMachine based on system architecture
install_nomachine() {
    case "$(uname -m)" in
        x86_64)
            echo "Installing NoMachine for x86_64 architecture..."
            # Replace with actual download link for x86_64
            wget https://download.nomachine.com/download/8.11/Linux/nomachine_8.11.3_4_x86_64.rpm
            sudo dpkg -i nomachine_8.11.3_4_x86_64.rpm
            ;;
        arm64)
            echo "Installing NoMachine for arm64 architecture..."
            # Replace with actual download link for arm64
            wget https://download.nomachine.com/download/8.11/Linux/nomachine_8.11.3_4_amd64.deb
            sudo dpkg -i nomachine_8.11.3_4_amd64.deb
            ;;
        *)
            echo "Unsupported architecture: $(uname -m)"
            exit 1
            ;;
    esac
}

# Function to install browsers using Docker
install_browser() {
    case $choice in
        1)
            echo "Installing Chromium..."
            docker run -d \
                --name=chromium \
                --security-opt seccomp=unconfined \
                -e PUID=1000 \
                -e PGID=1000 \
                -e TZ=Etc/UTC \
                -p 3000:3000 \
                -p 3001:3001 \
                -v /chromium:/config \
                --shm-size="7gb" \
                --restart unless-stopped \
                --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
                -e NO_VNC_SERVER="true" \
                ghcr.io/linuxserver/chromium:latest
            ;;
        2)
            echo "Installing Firefox..."
            docker run -d \
                --name=firefox \
                --security-opt seccomp=unconfined \
                -e PUID=1000 \
                -e PGID=1000 \
                -e TZ=Etc/UTC \
                -p 3000:3000 \
                -p 3001:3001 \
                -v /firefox:/config \
                --shm-size="7gb" \
                --restart unless-stopped \
                --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
                -e NO_VNC_SERVER="true" \
                ghcr.io/linuxserver/firefox:latest
            ;;
        3)
            echo "Installing Opera..."
            docker run -d \
                --name=opera \
                --security-opt seccomp=unconfined \
                -e PUID=1000 \
                -e PGID=1000 \
                -e TZ=Etc/UTC \
                -p 3000:3000 \
                -p 3001:3001 \
                -v /opera:/config \
                --shm-size="7gb" \
                --restart unless-stopped \
                --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
                -e NO_VNC_SERVER="true" \
                ghcr.io/linuxserver/opera:latest
            ;;
        4)
            echo "Installing Mullvad Browser..."
            docker run -d \
                --name=mullvad-browser \
                --security-opt seccomp=unconfined \
                -e PUID=1000 \
                -e PGID=1000 \
                -e TZ=Etc/UTC \
                -p 3000:3000 \
                -p 3001:3001 \
                -v /mullvad-browser:/config \
                --shm-size="7gb" \
                --restart unless-stopped \
                --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
                -e NO_VNC_SERVER="true" \
                ghcr.io/linuxserver/mullvad-browser:latest
            ;;
        5)
            echo "Installing Microsoft Edge..."
            docker run -d \
                --name=edge \
                --security-opt seccomp=unconfined \
                -e PUID=1000 \
                -e PGID=1000 \
                -e TZ=Etc/UTC \
                -p 3000:3000 \
                -p 3001:3001 \
                -v /edge:/config \
                --shm-size="7gb" \
                --restart unless-stopped \
                --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
                -e NO_VNC_SERVER="true" \
                ghcr.io/linuxserver/microsoft-edge:latest
            ;;
        *)
            echo "Invalid choice. Please try again."
            exit 1
            ;;
    esac
}

#######################################################

echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Yellow} ID ${White} |                   ${BPurple}   Browser Name                       ${White}   |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Red}[${Yellow}01${Red}]${White} |$Green Install Chromium${White}                                           |"
echo -e "${White}     | ${Red}[${Yellow}02${Red}]${White} |$Green Install Firefox${White}                                            |"
echo -e "${White}     | ${Red}[${Yellow}03${Red}]${White} |$Green Install Opera${White}                                              |"
echo -e "${White}     | ${Red}[${Yellow}04${Red}]${White} |$Green Install Mullvad Browser${White}                                    |"
echo -e "${White}     | ${Red}[${Yellow}05${Red}]${White} |$Green Install Microsoft Edge${White}                                      |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo ""
echo -e -n "$White    ${Red} [${Cyan}!Note:${Red}]$White If your choice is Chromium type $Green 1${White} not ${Red}01$White and the same principle applies to other browsers "
echo ""
echo ""
echo -e -n "$White    ${Red} [${Cyan}!${Red}]$White Type the$BRed ID$White "
read -p "of your choice : " choice

# Install NoMachine
echo "Installing NoMachine..."
install_nomachine

# Install selected browser
install_browser

# After browser installation, display connection details
echo ""
echo -e "${Yellow}  +-------------------------------------------------------------------+"
echo -e "${White}  | ${BPurple}  Browser Installed!${White}                                        |"
echo -e "${Yellow}  +-------------------------------------------------------------------+"
echo ""
echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} To start the browser, connect to your NoMachine session and run:"
echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip] "
echo -e "${White}      ${Red} vncserver -localhost :5901 ${White} "
