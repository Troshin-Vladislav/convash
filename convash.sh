#!/bin/bash

#########################################################
# Author: Troshin.Vlad									#
# git: https://github.com/Troshin-Vladislav				#
# Date: 05.09.2019										#
# Name: convash (converter bash)						#
#########################################################


_VERSION="0.1"

DEFAULT="\e[0m"			# @default
BOLD="\e[1m"			# @bold
INLINE="\e[3m"			# @inline
UNDERLINE="\e[4m"		# @underline
BLINKING="\e[5m"		# @blinking
REVERSE="\e[7m"			# @reverse

BLACK="\e[30m"			# @black
RED="\e[31m"			# @red
GREEN="\e[32m"			# @green
YELLOW="\e[33m"			# @yellow
BLUE="\e[34m"			# @blue
PURPLE="\e[35m"			# @purple
CYAN="\e[36m"			# @cyan | @aqua
GREY="\e[37m"			# @grey

BACKGROUND_BLACK="\e[40m"			# @background.black		> @b.black
BACKGROUND_RED="\e[41m"				# @background.red		> @b.red
BACKGROUND_GREEN="\e[42m"			# @background.green		> @b.green
BACKGROUND_YELLOW="\e[43m"			# @background.yellow	> @b.yellow
BACKGROUND_BLUE="\e[44m"			# @background.blue		> @b.blue
BACKGROUND_PURPLE="\e[45m"			# @background.purple	> @b.purple
BACKGROUND_CYAN="\e[46m"			# @background.cyan		> @b.cyan
BACKGROUND_GREY="\e[47m"			# @background.grey		> @b.grey


if [ $# -lt 1 ]
then
	echo -e "["$RED"error"$DEFAULT"]: convash: is few arguiments" > /dev/stderr
	echo -e "Usage: convash <file>" > /dev/stderr
	exit 1
fi

target="$1"
if [ ! -f $target ]
then
	echo -e "["$RED"error"$DEFAULT"]: file is not found"
	exit 1
fi

# s:@blue:\\\e[31m:g
result=`sed -e '
s:@default:\\'$DEFAULT':g
s:@bold:\\'$BOLD':g
s:@inline:\\'$INLINE':g
s:@underline:\\'$UNDERLINE':g
s:@blinking:\\'$BLINKING':g
s:@reverse:\\'$REVERSE':g
s:@black:\\'$BLACK':g
s:@red:\\'$RED':g
s:@green:\\'$GREEN':g
s:@yellow:\\'$YELLOW':g
s:@blue:\\'$BLUE':g
s:@purple:\\'$PURPLE':g
s:@cyan\|@aqua:\\'$CYAN':g
s:@grey:\\'$GREY':g
s:@background.black\|@b.black:\\'$BACKGROUND_BLACK':g
s:@background.red\|@b.red:\\'$BACKGROUND_RED':g
s:@background.green\|@b.green:\\'$BACKGROUND_GREEN':g
s:@background.yellow\|@b.yellow:\\'$BACKGROUND_YELLOW':g
s:@background.blue\|@b.blue:\\'$BACKGROUND_BLUE':g
s:@background.purple\|@b.purple:\\'$BACKGROUND_PURPLE':g
s:@background.cyan\|@b.cyan:\\'$BACKGROUND_CYAN':g
s:@background.grey\|@b.grey:\\'$BACKGROUND_GREY':g
' $target`

echo -e "$result"

exit 0