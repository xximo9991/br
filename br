#!/bin/bash

# Regular Colors
Black='\e[0;30m'    # Black
Red='\e[0;31m'      # Red
Green='\e[0;32m'    # Green
Yellow='\e[0;33m'   # Yellow
Blue='\e[0;34m'     # Blue
Purple='\e[0;35m'   # Purple
Cyan='\e[0;36m'     # Cyan
White='\e[0;37m'    # White

# Bold
BBlack='\e[1;30m'   # Black
BRed='\e[1;31m'     # Red
BGreen='\e[1;32m'   # Green
BYellow='\e[1;33m'  # Yellow
BBlue='\e[1;34m'    # Blue
BPurple='\e[1;35m'  # Purple
BCyan='\e[1;36m'    # Cyan
BWhite='\e[1;37m'   # White

#######################################################

echo -ne '\033c'
trap RM_HT_FOLDER SIGINT SIGQUIT SIGTSTP
echo ""
sleep 0.1
sleep 0.1
echo -e "                     |${BRed} Online Browser Installer${Cyan} by${BGreen} Hamza Hammouch${Cyan} powered by${BPurple} linuxserver${Yellow} |"
sleep 0.1
echo -e "                     ${Cyan}+--------------------------------------------------------+"
sleep 0.1
echo "############################################################"
echo "- ----------------------------------------------------------+"
echo "${White}  | ${Yellow} ID ${White} |          ${BPurple}    Browser Name            ${White}      |"
echo "- ----------------------------------------------------------+"
echo "${White}  | ${Red}[${Yellow}01${Red}]${White} | ${Green} Install Chromium         ${White}            |"
echo "${White}  | ${Red}[${Yellow}02${Red}]${White} | ${Green} Install Firefox          ${White}            |"
echo "${White}  | ${Red}[${Yellow}03${Red}]${White} | ${Green} Install Opera            ${White}            |"
echo "${White}  | ${Red}[${Yellow}04${Red}]${White} | ${Green} Install Mullvad Browser  ${White}            |"
echo "${White}  | ${Red}[${Yellow}05${Red}]${White} | ${Green} Install Microsoft Edge   ${White}            |"
echo "${Yellow}  +-------------------------------------------------------------------+"
echo ""
echo -e -n "${White}  ${Red} [${Cyan}!${Red}]${White} Note: If your choice is Chromium, type ${Green}1${White} not ${Red}01${White}. Same principle applies to other browsers."
echo ""
echo ""
echo -e -n "${White}  ${Red} [${Cyan}!${Red}]${White} Type the ${BRed}ID${White} of your choice: "
read -p "" choice
case $choice in
  1)
    echo "Installing Chromium..."
    docker run -d \
      --name=chromium \
      --security-opt seccomp=unconfined \
      -e PUID=1000 \
      -e PGID=1000 \
      -e TZ=Etc/UTC \
      -v /chromium:/config \
      --shm-size="7gb" \
      --restart unless-stopped \
      -c 2 \
      -m 2g \
      --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
      -e NO_VNC_SERVER="true" \
      ghcr.io/linuxserver/chromium:latest

    # Get container IP and port
    container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' chromium)
    container_port=$(docker port chromium | cut -d':' -f2)

    # Print connection details
    echo ""
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo -e "${White}  | ${BPurple}  Browser Installed!${White}                                        |"
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} To start Chromium, connect to your NoMachine session and run:"
    echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip]"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Then, in the NoMachine session, run:"
    echo -e "${White}      ${Red} vncserver -localhost :5901"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Use the following details to access Chromium:"
    echo -e "${White}      ${Red} Host: ${container_ip}"
    echo -e "${White}      ${Red} Port: ${container_port}"
    echo ""

    ;;
  2)
    echo "Installing Firefox..."
    docker run -d \
      --name=firefox \
      --security-opt seccomp=unconfined \
      -e PUID=1000 \
      -e PGID=1000 \
      -e TZ=Etc/UTC \
      -v /firefox:/config \
      --shm-size="7gb" \
      --restart unless-stopped \
      -c 2 \
      -m 2g \
      --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
      -e NO_VNC_SERVER="true" \
      ghcr.io/linuxserver/firefox:latest

    # Get container IP and port
    container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' firefox)
    container_port=$(docker port firefox | cut -d':' -f2)

    # Print connection details
    echo ""
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo -e "${White}  | ${BPurple}  Browser Installed!${White}                                        |"
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} To start Firefox, connect to your NoMachine session and run:"
    echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip]"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Then, in the NoMachine session, run:"
    echo -e "${White}      ${Red} vncserver -localhost :5901"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Use the following details to access Firefox:"
    echo -e "${White}      ${Red} Host: ${container_ip}"
    echo -e "${White}      ${Red} Port: ${container_port}"
    echo ""

    ;;
  3)
    echo "Installing Opera..."
    docker run -d \
      --name=opera \
      --security-opt seccomp=unconfined \
      -e PUID=1000 \
      -e PGID=1000 \
      -e TZ=Etc/UTC \
      -v /opera:/config \
      --shm-size="7gb" \
      --restart unless-stopped \
      -c 2 \
      -m 2g \
      --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
      -e NO_VNC_SERVER="true" \
      ghcr.io/linuxserver/opera:latest

    # Get container IP and port
    container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' opera)
    container_port=$(docker port opera | cut -d':' -f2)

    # Print connection details
    echo ""
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo -e "${White}  | ${BPurple}  Browser Installed!${White}                                        |"
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} To start Opera, connect to your NoMachine session and run:"
    echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip]"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Then, in the NoMachine session, run:"
    echo -e "${White}      ${Red} vncserver -localhost :5901"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Use the following details to access Opera:"
    echo -e "${White}      ${Red} Host: ${container_ip}"
    echo -e "${White}      ${Red} Port: ${container_port}"
    echo ""

    ;;
  4)
    echo "Installing Mullvad Browser..."
    docker run -d \
      --name=mullvad-browser \
      --security-opt seccomp=unconfined \
      -e PUID=1000 \
      -e PGID=1000 \
      -e TZ=Etc/UTC \
      -v /mullvad-browser:/config \
      --shm-size="7gb" \
      --restart unless-stopped \
      -c 2 \
      -m 2g \
      --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
      -e NO_VNC_SERVER="true" \
      ghcr.io/linuxserver/mullvad-browser:latest

    # Get container IP and port
    container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mullvad-browser)
    container_port=$(docker port mullvad-browser | cut -d':' -f2)

    # Print connection details
    echo ""
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo -e "${White}  | ${BPurple}  Browser Installed!${White}                                        |"
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} To start Mullvad Browser, connect to your NoMachine session and run:"
    echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip]"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Then, in the NoMachine session, run:"
    echo -e "${White}      ${Red} vncserver -localhost :5901"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Use the following details to access Mullvad Browser:"
    echo -e "${White}      ${Red} Host: ${container_ip}"
    echo -e "${White}      ${Red} Port: ${container_port}"
    echo ""

    ;;
  5)
    echo "Installing Microsoft Edge..."
    docker run -d \
      --name=microsoft-edge \
      --security-opt seccomp=unconfined \
      -e PUID=1000 \
      -e PGID=1000 \
      -e TZ=Etc/UTC \
      -v /microsoft-edge:/config \
      --shm-size="7gb" \
      --restart unless-stopped \
      -c 2 \
      -m 2g \
      --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
      -e NO_VNC_SERVER="true" \
      ghcr.io/linuxserver/microsoft-edge:latest

    # Get container IP and port
    container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' microsoft-edge)
    container_port=$(docker port microsoft-edge | cut -d':' -f2)

    # Print connection details
    echo ""
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo -e "${White}  | ${BPurple}  Browser Installed!${White}                                        |"
    echo -e "${Yellow}  +-------------------------------------------------------------------+"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} To start Microsoft Edge, connect to your NoMachine session and run:"
    echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip]"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Then, in the NoMachine session, run:"
    echo -e "${White}      ${Red} vncserver -localhost :5901"
    echo ""
    echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Use the following details to access Microsoft Edge:"
    echo -e "${White}      ${Red} Host: ${container_ip}"
    echo -e "${White}      ${Red} Port: ${container_port}"
    echo ""

    ;;
  *)
    echo "Invalid choice. Please try again."
    exit 1
    ;;
esac

echo ""
echo -e "${Yellow}  +-------------------------------------------------------------------+"
echo -e "${White}  | ${BPurple}  Browser Installed!${White}                                        |"
echo -e "${Yellow}  +-------------------------------------------------------------------+"
echo ""
echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} To start the browser, connect to your NoMachine session and run:"
echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip]"
echo ""
echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} Then, in the NoMachine session, run:"
echo -e "${White}      ${Red} vncserver -localhost :5901"
echo ""

# Function to remove temporary folder on exit
RM_HT_FOLDER() {
  rm -rf /tmp/ht
}
