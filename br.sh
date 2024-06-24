#!/bin/bash

# تحقق من تثبيت Docker وتثبيته إذا لم يكن مثبتًا
if ! command -v docker &> /dev/null; then
    echo "تثبيت Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    echo "أعد تشغيل الجلسة الحالية أو قم بتسجيل الخروج والدخول مرة أخرى لتفعيل التغييرات على عضوية Docker."
    exit 1
fi

# Regular Colors
Black='\e[0;30m'        # أسود
Red='\e[0;31m'          # أحمر
Green='\e[0;32m'        # أخضر
Yellow='\e[0;33m'       # أصفر
Blue='\e[0;34m'         # أزرق
Purple='\e[0;35m'       # بنفسجي
Cyan='\e[0;36m'         # سماوي
White='\e[0;37m'        # أبيض

# Bold
BBlack='\e[1;30m'       # أسود بالخط العريض
BRed='\e[1;31m'         # أحمر بالخط العريض
BGreen='\e[1;32m'       # أخضر بالخط العريض
BYellow='\e[1;33m'      # أصفر بالخط العريض
BBlue='\e[1;34m'        # أزرق بالخط العريض
BPurple='\e[1;35m'      # بنفسجي بالخط العريض
BCyan='\e[1;36m'        # سماوي بالخط العريض
BWhite='\e[1;37m'       # أبيض بالخط العريض

#######################################################

# تنظيف الشاشة وإعداد رسائل الإشعار
echo -ne '\033c'
trap RM_HT_FOLDER SIGINT SIGQUIT SIGTSTP
echo ""
sleep 0.1
echo -e "${Cyan}    +${Yellow}--------------------------------------------------------------------------------------------------------------------------${Cyan}+${Yellow}"
sleep 0.1
echo -e "                                     |${BRed} متصفح الإنترنت عبر الإنترنت ${BYellow}بواسطة${BGreen} حمزة حموش${Cyan} مدعوم من${BPurple} linuxserver${Yellow} |"
sleep 0.1
echo -e "                                     ${Cyan}+${Yellow}--------------------------------------------------------${Cyan}+"
sleep 0.1

#######################################################

# دالة لحذف المجلد المؤقت عند الخروج
RM_HT_FOLDER() {
  rm -rf /tmp/ht
}

# دالة لتثبيت NoMachine بناءً على هندسة النظام
install_nomachine() {
    case "$(uname -m)" in
        x86_64)
            echo "جارٍ تثبيت NoMachine لهندسة x86_64..."
            # استبدال الرابط الفعلي برابط التنزيل لـ x86_64
            wget https://download.nomachine.com/download/8.11/Linux/nomachine_8.11.3_4_amd64.deb
            sudo dpkg -i nomachine_8.11.3_4_amd64.deb
            ;;
        arm64)
            echo "جارٍ تثبيت NoMachine لهندسة arm64..."
            # استبدال الرابط الفعلي برابط التنزيل لـ arm64
            wget https://download.nomachine.com/download/8.11/Linux/nomachine_8.11.3_4_amd64.deb
            sudo dpkg -i nomachine_8.11.3_4_amd64.deb
            ;;
        *)
            echo "الهندسة غير مدعومة: $(uname -m)"
            exit 1
            ;;
    esac
}

# دالة لتثبيت المتصفحات باستخدام Docker
install_browser() {
    case $choice in
        1)
            echo "جارٍ تثبيت Chromium..."
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
            echo "جارٍ تثبيت Firefox..."
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
            echo "جارٍ تثبيت Opera..."
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
            echo "جارٍ تثبيت Mullvad Browser..."
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
            echo "جارٍ تثبيت Microsoft Edge..."
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
            echo "خيار غير صالح. يرجى المحاولة مرة أخرى."
            exit 1
            ;;
    esac
}

#######################################################

# عرض القائمة لاختيار المتصفح
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Yellow} ID ${White} |                   ${BPurple}   اسم المتصفح                       ${White}   |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Red}[${Yellow}01${Red}]${White} |$Green تثبيت Chromium${White}                                           |"
echo -e "${White}     | ${Red}[${Yellow}02${Red}]${White} |$Green تثبيت Firefox${White}                                            |"
echo -e "${White}     | ${Red}[${Yellow}03${Red}]${White} |$Green تثبيت Opera${White}                                              |"
echo -e "${White}     | ${Red}[${Yellow}04${Red}]${White} |$Green تثبيت Mullvad Browser${White}                                    |"
echo -e "${White}     | ${Red}[${Yellow}05${Red}]${White} |$Green تثبيت Microsoft Edge${White}                                      |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo ""
echo -e -n "$White    ${Red} [${Cyan}!ملاحظة:${Red}]$White إذا كان اختيارك هو Chromium اكتب $Green 1${White} لا ${Red}01$White وينطبق نفس الأمر على المتصفحات الأخرى "
echo ""
echo ""
echo -e -n "$White    ${Red} [${Cyan}!${Red}]$White اكتب$BRed رقم المعرف$White "
read -p "المطلوب : " choice

# تثبيت NoMachine أولاً
echo "جارٍ تثبيت NoMachine..."
install_nomachine

# تثبيت المتصفح المحدد ضمن حاوية Docker
install_browser

# بعد تثبيت المتصفح، عرض تفاصيل الاتصال
echo ""
echo -e "${Yellow}  +-------------------------------------------------------------------+"
echo -e "${White}  | ${BPurple}  تم تثبيت المتصفح بنجاح!${White}                                        |"
echo -e "${Yellow}  +-------------------------------------------------------------------+"
echo ""
echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} لبدء المتصفح، اتصل بجلسة NoMachine الخاصة بك وقم بتشغيل:"
echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip] "
echo -e "${White}      ${Red} vncserver -localhost :5901 ${White} "
