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
        mpv  --autofit-larger=90%x90% "$file"
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

