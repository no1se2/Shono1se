#!/bin/bash

RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"
apt-get install python-setuptools
reset_color() {
    tput sgr0
    tput op
   return
}
clear
read -p "                    $WHITE Please Enter Your Name My G:$REDBG " Name
clear
reset_color
clear
read -p "                    $WHITE Whats your shodan API Key?:$REDBG " API
reset_color
clear
shodan init $API
clear
reset_color
no1selogo() {
    echo "                     $WHITE ███████ ██   ██  ██████  ███    ██  ██████   ██ ███████ ███████ "
sleep 0.1
echo -e "                     $RED ██      ██   ██ ██    ██ ████   ██ ██    ██ ███ ██      ██"
sleep 0.1
echo -e "                     $WHITE ███████ ███████ ██    ██ ██ ██  ██ ██    ██  ██ ███████ █████"
sleep 0.1
echo -e "                     $RED      ██ ██   ██ ██    ██ ██  ██ ██ ██    ██  ██      ██ ██      "
sleep 0.1
echo -e "                     $WHITE ███████ ██   ██  ██████  ██   ████  ██████   ██ ███████ ███████ "
sleep 0.1
echo -e "                                                  $WHITE Welcome To Shono1se $RED($Name)"
}

menu() {
no1selogo
sleep 0.1
echo "                       $WHITE 1: $RED Download from shodan                $WHITE |\/| |__| |  \ |___    | | | |  |  |__|    $RED|    |  | |  | |___ "
sleep 0.1
echo "                       $WHITE 2: $RED Get information About Ip            $WHITE |  | |  | |__/ |___    |_|_| |  |  |  |    $RED|___ |__|  \/  |___"
sleep 0.1
echo "                       $WHITE 3: $RED Show your ip                     $WHITE|__]  \_/     $RED|\ | |  | [__  |___"
sleep 0.1
echo "                       $WHITE 4: $RED Open no1se playground            $RED|__]   |      $WHITE| \| |__| ___] |___"
sleep 0.1
echo "                       $WHITE 5: $RED filter list only to IPs"
sleep 0.1
echo "                       $WHITE 6: $RED Count Devices"
sleep 0.1
echo "                       $WHITE 7: $RED Search for Devices With shodan"
sleep 0.1
read -p "                                                                  $RED Please Selecet $WHITE An option: "
case $REPLY in
    1 | 01)
clear
option1;;
    2 | 02)
clear
option2;;
    3 | 03)
clear
option3;;
    4 | 04)
google-chrome --no--sandbox https://no1seplaground.netlify.app
clear
menu;;
    5 | 05)
clear
option5;;
    6 | 06)
clear
option6;;
    7 | 07)
clear
option7;;
*)
esac
}
menu

option1() {
no1selogo
echo ""
read -p "   $ORANGE (Leave Blank if you donw want) $WHITE What Is The port You Want To Download?:$RED " Pname
read -p "   $ORANGE (Leave Blank if you donw want) $WHITE What is the country You Want To Filter?:$RED " Cname
read -p "   $ORANGE (Leave Blank if you donw want) $WHITE What is the City You Want To Filter?:$RED " Ciname
echo ""
echo "$WHITE Ok Please Wait I will Save The File In $RED the Same Folder The script is Saved"
sleep 2
shodan download port:$Pname country:$Cname city:"$Ciname"
sleep 1
echo ""
echo "$WHITE DONE! File name is "port:$Pname.json.gz" Saved in :$RED $PWD"
echo ""
read -p "$WHITE Do you Want to Download Again?:(Y/N):$RED " Download
case $Download in
    y | Y)
clear
option1;;
    n | N)
clear
menu;;
*)
esac
}
option2() {
no1selogo
echo ""
read -p "$WHITE Enter The Ip You Want To search:$RED " ipp
echo ""
shodan host $ipp
echo ""
read -p "$WHITE Do You Want To Search Again?(Y/N):$RED " Search
case $Search in
    y | Y)
clear
option2;;
    n | N)
clear
menu;;
*)
esac
}
option3() {
no1selogo
echo ""
echo "$WHITE Your public IP address $RED $Name"
echo ""
shodan myip
echo ""
read -p "$WHITE Do You Want To Go Back?(Y/N):$RED " Back

case $Back in
    y | Y)
clear
menu;;
    n | N)
clear
exit;;
*)
esac
}
option5 () {
no1selogo
echo ""
read -p "$WHITE Please write The Name of The File You Want To Filter($ORANGE example:port:80.json.gz):$RED " File
echo ""
shodan parse --fields ip_str $File
echo ""
echo "$WHITE FIlterd List Saved in $RED $PWD"
echo ""
read -p "$WHITE Do you Want to Filter another file?(Y/N)$REDBG " Back2
reset_color
case $Back2 in
    y | Y)
clear
option5;;
    n | N)
clear
menu;;
*)
esac
}
option6countport () {
no1selogo
echo ""
read -p "$WHITE Enter The Port You Want To Scan:$REDBG " portt
reset_color
shodan count port:$portt
echo ""
read -p "$WHITE Do you want to count again?(Y/N):$REDBG " counttt
reset_color
case $counttt in
    y | Y)
clear
option6countport;;
    n | N)
clear
menu;;
*)
esac
}
option6countdevice () {
no1selogo
echo ""
read -p "$WHITE Enter The Device Name You Want To Scan:$REDBG " devicen
reset_color
shodan count $devicen
echo ""
read -p "$WHITE Do you want to count again?(Y/N):$REDBG " counttt
reset_color
case $counttt in
    y | Y)
clear
option6countdevice;;
    n | N)
clear
menu;;
*)
esac
}
option6 () {
no1selogo
echo ""
read -p "$WHITE Do You Want To Count A port Or a Device?$RED(1 for port - 2 for device): " cohice
reset_color
case $cohice in
    1)
clear
option6countport;;
    2)
clear
option6countdevice;;
*)
esac
}
option7 () {
no1selogo
echo ""
read -p "$WHITE Enter The Device/Protocol Name To Search:$REDBG " Searchh
reset_color
echo ""
shodan search --fields ip_str,port,org,hostnames $Searchh
echo ""
read -p "$WHITE Do you want to Search Again?(Y/N):$REDBG " Searchhh
reset_color
case $Searchhh in
    Y | y)
clear
option7;;
    N | n)
clear
menu;;
*)
esac
}


case $REPLY in
    1 | 01)
clear
option1;;
    2 | 02)
clear
option2;;
    3 | 03)
clear
option3;;
    4 | 04)
google-chrome --no--sandbox https://no1seplaground.netlify.app
clear
menu;;
    5 | 05)
clear
option5;;
    6 | 06)
clear
option6;;
    7 | 07)
clear
option7;;
*)
esac

