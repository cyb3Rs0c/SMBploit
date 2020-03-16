#!/bin/bash

#Author: d4t4s3c
#Email:  d4t4s3c@protonmail.com
#GitHub: www.github.com/d4t4s3c

#colors
b="\033[1;37m"
r="\033[1;31m"
v="\033[1;32m"
a="\033[1;33m"
nc="\e[0m"

#var
si=✔
no=x

function checkroot(){
	    echo ""
	    echo -e "$a check root user $nc"
	    sleep 4
    if [ "$(id -u)" == "0" ]; then
	    echo ""
	    echo -e " $b[$v$si$b] root $nc"
	    sleep 4
	    echo ""
    else
            echo ""
	    echo -e " $b[$r$no$b] root $nc"
	    sleep 4
	    echo ""
	    echo -e "$r EXITING $nc"
	    sleep 4
	    echo ""
	    exit
    fi	
}

checkroot
tput civis
service postgresql start
clear
sleep 1

function banner(){
       echo -e "$b ┌══════════════════════════════════════════┐"
       echo -e "$b ║$v  ____  __  __ ____        _       _ _    $b║"
       echo -e "$b ║$v / ___||  \/  | __ ) _ __ | | ___ (_) |_  $b║"
       echo -e "$b ║$v \___ \| |\/| |  _ \| '_ \| |/ _ \| | __| $b║"
       echo -e "$b ║$v  ___) | |  | | |_) | |_) | | (_) | | |_  $b║"
       echo -e "$b ║$v |____/|_|  |_|____/| .__/|_|\___/|_|\__| $b║"   
       echo -e "$b ║$v                    |_|                   $b║"
       echo -e "$b ║$r  Author  $b: $a d4t4s3c                      $b║"
       echo -e "$b ║$r  Email   $b: $a d4t4s3c@protonmail.com       $b║"
       echo -e "$b ║$r  GitHub  $b: $a www.github.com/d4t4s3c       $b║"
       echo -e "$b └══════════════════════════════════════════┘$b"
}

banner
sleep 2

echo ""
echo -e "$b[$v+$b]$a Installing Xterm $nc"
sleep 4
echo ""
apt-get install -y xterm
echo ""
echo -e "$b[$v+$b]$a Add exploit to Metasploit-Framework $nc"
sleep 4
cp SMBploit.rb /usr/share/metasploit-framework/modules/exploits/windows/smb
echo ""
echo -e "$b[$v+$b]$a Reloading Modules $nc"
sleep 4
xterm -hold -e "msfconsole -q -r reload.rc" &
echo ""
echo -e "$b[$v+$b]$a Installing Wine $nc"
sleep 4
echo ""
apt-get install -y wine
echo ""
echo -e "$b[$v+$b]$a Installing Wine32 $nc"
sleep 4
echo ""
dpkg --add-architecture i386 && apt-get install -y wine32
echo ""
echo -e "$b[$v+$b]$a Update $nc"
sleep 4
echo ""
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
echo ""
echo -e "$b[$v+$b]$a Testing Wine$nc"
echo ""
sleep 4
echo -e "$b[$v+$b]$r Close the popup when you present a$v cmd$nc $b-$r Cierre la ventana emergente cuando presente un$v cmd$nc"
echo ""
sleep 4
xterm -hold -e "wine cmd.exe" &
echo -e "$b[$v+$b]$a Installation Completed $nc"
echo""
sleep 4
tput cnorm
exit
