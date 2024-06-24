#!/bin/bash

# ألوان النصوص
Black='\e[0;30m'        
Red='\e[0;31m'          
Green='\e[0;32m'        
Yellow='\e[0;33m'       
Blue='\e[0;34m'         
Purple='\e[0;35m'       
Cyan='\e[0;36m'         
White='\e[0;37m'        

# ألوان النصوص بخط عريض
BBlack='\e[1;30m'       
BRed='\e[1;31m'         
BGreen='\e[1;32m'       
BYellow='\e[1;33m'      
BBlue='\e[1;34m'        
BPurple='\e[1;35m'      
BCyan='\e[1;36m'        
BWhite='\e[1;37m'       

# دالة لحذف المجلد المؤقت عند الخروج
RM_HT_FOLDER() {
  rm -rf /tmp/ht
}

# التقاط الإشارات لحذف المجلد المؤقت
trap RM_HT_FOLDER SIGINT SIGQUIT SIGTSTP

# مسح الشاشة
echo -ne '\033c'

# عرض العنوان
echo ""
echo -e "${Cyan}    +${Yellow}--------------------------------------------------------------------------------------------------------------------------${Cyan}+${Yellow}"
echo -e "                                     |${BRed} متصفح الإنترنت الأونلاين ${BYellow}من قبل${BGreen} حمزة حموش${Cyan} مدعوم بواسطة${BPurple} linuxserver${Yellow} |"
echo -e "                                     ${Cyan}+${Yellow}--------------------------------------------------------${Cyan}+"
echo ""

# عرض خيارات التصفح
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Yellow} الرقم ${White} |                   ${BPurple}   اسم المتصفح                       ${White}   |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Red}[${Yellow}01${Red}]${White} |$Green تثبيت كروميوم${White}                                           |"
echo -e "${White}     | ${Red}[${Yellow}02${Red}]${White} |$Green تثبيت فايرفوكس${White}                                          |"
echo -e "${White}     | ${Red}[${Yellow}03${Red}]${White} |$Green تثبيت أوبرا${White}                                              |"
echo -e "${White}     | ${Red}[${Yellow}04${Red}]${White} |$Green تثبيت متصفح مولفاد${White}                                    |"
echo -e "${White}     | ${Red}[${Yellow}05${Red}]${White} |$Green تثبيت مايكروسوفت إيدج${White}                                  |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo ""

# استقبال اختيار المستخدم
echo -e -n "$White    ${Red} [${Cyan}!${Red}]$White اكتب ال${BRed}رقم${White} المراد تحديده: "
read choice

# معالجة اختيار المستخدم
case $choice in
    1)
        echo "جاري تثبيت كروميوم..."
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
        echo "جاري تثبيت فايرفوكس..."
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
        echo "جاري تثبيت أوبرا..."
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
        echo "جاري تثبيت متصفح مولفاد..."
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
        echo "جاري تثبيت مايكروسوفت إيدج..."
        docker run -d \
            --name=microsoft-edge \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /microsoft-edge:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            --mount type=bind,source=/path/to/lightweight-desktop-environment,destination=/usr/share/X11 \
            -e NO_VNC_SERVER="true" \
            ghcr.io/linuxserver/microsoft-edge:latest
        ;;

    *)
        echo "الرقم المدخل غير صحيح. يرجى المحاولة مرة أخرى."
        exit 1
        ;;
esac

# الحصول على عنوان IP ومنفذ الحاوية
container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $choice)
container_port=$(docker port $choice | cut -d':' -f2)

# عرض تفاصيل الاتصال
echo ""
echo -e "${Yellow}  +-------------------------------------------------------------------+"
echo -e "${White}  | ${BPurple}  تم تثبيت المتصفح بنجاح!${White}                                        |"
echo -e "${Yellow}  +-------------------------------------------------------------------+"
echo ""
echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} لبدء المتصفح، قم بالاتصال بجلسة NoMachine الخاصة بك وقم بتشغيل:"
echo -e "${White}      ${Red} nomachine --connect [remote-machine-ip]"
echo ""
echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} ثم، في جلسة NoMachine، قم بتشغيل:"
echo -e "${White}      ${Red} vncserver -localhost :5901"
echo ""
echo -e "${White}  ${Red} [${Cyan}!${Red}]${White} استخدم التفاصيل التالية للوصول إلى المتصفح:"
echo -e "${White}      ${Red} Host: ${container_ip}"
echo -e "${White}      ${Red} Port: ${container_port}"
echo ""

# خروج البرنامج
exit 0
