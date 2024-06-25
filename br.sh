#!/bin/bash

# ألوان عادية
Black='\e[0;30m'        # أسود
Red='\e[0;31m'          # أحمر
Green='\e[0;32m'        # أخضر
Yellow='\e[0;33m'       # أصفر
Blue='\e[0;34m'         # أزرق
Purple='\e[0;35m'       # بنفسجي
Cyan='\e[0;36m'         # سماوي
White='\e[0;37m'        # أبيض

# عريضة
BBlack='\e[1;30m'       # أسود عريض
BRed='\e[1;31m'         # أحمر عريض
BGreen='\e[1;32m'       # أخضر عريض
BYellow='\e[1;33m'      # أصفر عريض
BBlue='\e[1;34m'        # أزرق عريض
BPurple='\e[1;35m'      # بنفسجي عريض
BCyan='\e[1;36m'        # سماوي عريض
BWhite='\e[1;37m'       # أبيض عريض

#######################################################

echo -ne '\033c'
trap RM_HT_FOLDER SIGINT SIGQUIT SIGTSTP
echo ""
sleep 0.1
echo -e "${Cyan}    +${Yellow}--------------------------------------------------------------------------------------------------------------------------${Cyan}+"
sleep 0.1
echo -e "                                     |${BRed} متصفح الإنترنت الأونلاين ${BYellow}بواسطة${BGreen} حمزة حموش${Cyan} مدعوم ب${BPurple} خادم لينكس${Yellow} |"
sleep 0.1
echo -e "                                     ${Cyan}+${Yellow}--------------------------------------------------------${Cyan}+"
sleep 0.1

#######################################################

# طلب إدخال Ngrok Authtoken
echo -e "${White}الرجاء إدخال Ngrok Authtoken للوصول:"
read -p "${White}Authtoken: " ngrok_token

# إعداد Ngrok Authtoken
./ngrok authtoken $ngrok_token

# بدء Ngrok واستخراج المعلومات
echo -e "${White}جاري تشغيل Ngrok..."
ngrok_output=$(./ngrok http 3000)

# استخراج معلومات الاتصال من Ngrok الناتج
ngrok_host=$(echo "$ngrok_output" | grep -oP "Forwarding\s+\Khttps?://[\w.-]+")
ngrok_port=$(echo "$ngrok_output" | grep -oP "Forwarding\s+\Khttps?://[\w.-]+:\K\d+")

#######################################################

echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Yellow} ID ${White} |                   ${BPurple}   اسم المتصفح                       ${White}   |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Red}[${Yellow}01${Red}]${White} |$Green تثبيت كروميوم${White}                                           |"
echo -e "${White}     | ${Red}[${Yellow}02${Red}]${White} |$Green تثبيت فايرفوكس${White}                                          |"
echo -e "${White}     | ${Red}[${Yellow}03${Red}]${White} |$Green تثبيت أوبرا${White}                                              |"
echo -e "${White}     | ${Red}[${Yellow}04${Red}]${White} |$Green تثبيت متصفح مولفاد${White}                                      |"
echo -e "${White}     | ${Red}[${Yellow}05${Red}]${White} |$Green تثبيت مايكروسوفت إيدج${White}                                    |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo ""
echo -e -n "$White    ${Red} [${Cyan}!ملاحظة:${Red}]$White إذا كان اختيارك كروميوم اكتب $Green 1${White} وليس ${Red}01$White ونفس المبدأ ينطبق على المتصفحات الأخرى "
echo ""
echo ""
echo -e -n "$White    ${Red} [${Cyan}!${Red}]$White اكتب رقم$BRed الهوية$White "
read -p "للاختيار : " choice
case $choice in
    1)
        echo "جارٍ تثبيت كروميوم..."
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
            ghcr.io/linuxserver/chromium:latest

        echo ""
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        echo -e "${Red}معلومات الاتصال بـ Ngrok:"
        echo -e "${White}الهوست: $ngrok_host"
        echo -e "${White}البورت: $ngrok_port"
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        ;;
    2)
        echo "جارٍ تثبيت فايرفوكس..."
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
            ghcr.io/linuxserver/firefox:latest

        echo ""
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        echo -e "${Red}معلومات الاتصال بـ Ngrok:"
        echo -e "${White}الهوست: $ngrok_host"
        echo -e "${White}البورت: $ngrok_port"
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        ;;
    3)
        echo "جارٍ تثبيت أوبرا..."
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
            ghcr.io/linuxserver/opera:latest

        echo ""
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        echo -e "${Red}معلومات الاتصال بـ Ngrok:"
        echo -e "${White}الهوست: $ngrok_host"
        echo -e "${White}البورت: $ngrok_port"
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        ;;
    4)
        echo "جارٍ تثبيت متصفح مولفاد..."
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
            ghcr.io/linuxserver/mullvad-browser:latest

        echo ""
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        echo -e "${Red}معلومات الاتصال بـ Ngrok:"
        echo -e "${White}الهوست: $ngrok_host"
        echo -e "${White}البورت: $ngrok_port"
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        ;;
    5)
        echo "جارٍ تثبيت مايكروسوفت إيدج..."
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
            ghcr.io/linuxserver/edge:latest

        echo ""
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        echo -e "${Red}معلومات الاتصال بـ Ngrok:"
        echo -e "${White}الهوست: $ngrok_host"
        echo -e "${White}البورت: $ngrok_port"
        echo -e "${Yellow}---------------------------------------------------------------------------${White}"
        ;;
    *)
        echo "اختيار غير صالح. الرجاء ادخال رقم من 1 إلى 5."
        exit 1
        ;;
esac

#######################################################

echo ""
sleep 0.1
echo -e "$White    ${Red} [${Green} ✔ ${Red}]$White تم تثبيت المتصفح بنجاح ( •̀ ω •́ )✧"
sleep 0.1
echo ""
sleep 0.1
echo ""
sleep 0.1
echo -e "    ${White}"
sleep 0.1
echo ""
