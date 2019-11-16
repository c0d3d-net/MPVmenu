#!/bin/bash
# MPV TERMINAL AUTOMENU
# AUTOMATICAL SCAN OF SELECTED PATH AND CREATE SELECTION MENU
# c0d3d space, 16.11.2019
clear
echo ""
echo "  .,-:::::       :::::::-.   .::.  :::::::-.    "
echo " ,;;;‘‘‘‘‘   ,;;, ;;,   ‘‘;,;‘‘‘;;, ;;,   ‘‘;,  "
echo " [[[        ,[‘  [n‘[[     [[   .n[[ ‘[[     [[ "
echo " SSS        SS    SSSS,    SS  ‘‘‘SSS.SS,    SS "
echo " ‘88bo,__,o,Y8,  ,8‘888_,o8P‘  ,,o888‘888_,o8P‘ "
echo "   ‘YUMMMMMP‘‘YmmP  MMMMP‘‘    YMMP‘  MMMMP‘‘space"
echo ""
echo " .--------.-----.--.--.--------.-----.-----.--.--."
echo " |        |  _  |  |  |        |  -__|     |  |  |"
echo " |__|__|__|   __|\___/|__|__|__|_____|__|__|_____|"
echo "          |__|                                    "
echo ""

## Checking if OS is DARWIN and if MPV player is installed.
## If OS is Darwin and MPV player is not installed, MPVmenu offers to install it with homebrew.
## If OS is not Darwin, mpvmenu will start but have to ensure yourself that MPV player is installed (means Linux Distros).
## Script to check MPV on Linux will be implemanted later.

file="/usr/local/bin/mpv"
unamestr=`uname`
start=${1:-"mpvmenu"}

if [[ "$unamestr" == 'Darwin' ]]; then
	if [ ! -f "$file" ]; then
    		echo "$0: MPV player not found."
		read -n 1 -p "MPVmenu can install MPV player using homebrew. If you have homebrew installed, press (i) to install MPV player now. Press (q) to quit. " ans;

		case $ans in
		    i|I)
			echo "Install MPV player with Homebrew.";
			brew install mpv;;
		    q|Q)
			clear;
			echo "Goodbye.";
		        exit;;
		esac
	fi
     else
     goto mpvmenu
fi



## MPVmenu
: mpvmenu

read -p "Enter video path: " vpath
files=( $vpath/* )
shopt -s extglob

string="@(${files[0]}"
for((i=1;i<${#files[@]};i++))
do
    string+="|${files[$i]}"
done
string+=")"

select file in "${files[@]}" "quit"
do
    case $file in
    $string)
        mpv --autofit-larger=90%x90% "$file"
        ## Uncomment this line if you want exit the menu after plaing:
        # break;
        ;;

    "quit")
        exit;;
    *)
        file=""
        echo "Please choose a number from 1 to $((${#files[@]}+1))";;
    esac
done

