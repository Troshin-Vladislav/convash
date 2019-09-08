#!/bin/bash

#########################################################
# Author: Troshin.Vlad									#
# git: https://github.com/Troshin-Vladislav				#
# Date: 05.09.2019										#
# Name: convash (converter bash)						#
#########################################################


CCOMPLETE="\e[32m"
CERROR="\e[31m"
CNOTE="\e[34m"
CDEFAULT="\e[0m"


_VERSION="0.2.7"
PREFIX='\e'

MODE_ORIGINAL="ON"
MODE_SHIELD="OFF"
MODE_MODIFY="OFF"
MODE_033="OFF"

OPTSED=''

# @function: help
_help(){
	_usage
	echo "options:"
	echo -e "\tmodify: \tmode modification file in place"
	echo -e "\tshielding: \tshielding code color"
	echo -e "\t033: \twrite prefix \033 instead \e"
	echo -e "\thelp: \t\toutput help page"
	echo -e "\tversion: \tprint version program and exit\n"
}

# @function: version
_version(){
	echo "convash.sh v"$_VERSION
	echo -e " ["$CCOMPLETE"+"$CDEFAULT"] add options"
}

_error(){
	echo -e "["$CERROR"error"$CDEFAULT"]: $1" 2> /dev/stderr
}

_usage(){
	echo -e "Usage: convash [options] <file>" > /dev/stderr
}

_note(){
	echo -e "["$CNOTE"note"$CDEFAULT"]: $1"
}

# Check arguments
if [ $# -lt 1 ]
then
	_error "convash: is few arguiments"
	_usage
	_help
	exit 1
fi


# Parse arguments
while [ -n "$1" ]
do
	case "$1" in
		modify)
			OPTSED='-i'
			PREFIX='x1b'
			MODE_MODIFY="ON"
			MODE_ORIGINAL="OFF"
			;;
		033)
			PREFIX='\033'
			MODE_033="ON"
			MODE_ORIGINAL="OFF"
			;;
		shielding)
			MODE_SHIELD="ON"
			;;
		help)
			_help
			exit 0
			;;
		version)
			_version
			exit 0
			;;
		*)
			if [ -f $1 ]; then
				target="$1"
			fi
			;;
	esac
	shift
done

# Parse setting options and notification
if [ $MODE_MODIFY == "ON" ] && [ $MODE_033 == "ON" ]; then
	PREFIX='\033'
	# _error "choice one mode, modify or 033"; exit 1
fi

if [ $MODE_SHIELD == "ON" ]; then
	case "ON" in
		$MODE_MODIFY)
			PREFIX='\'$PREFIX
			;;
		$MODE_ORIGINAL)
			PREFIX='\\\'$PREFIX
			;;
	esac
fi

# echo "[debug]: prefix($PREFIX), MODIFY($MODE_MODIFY)"

DEFAULT="$PREFIX[0m"		# @default
BOLD="$PREFIX[1m"			# @bold
INLINE="$PREFIX[3m"			# @inline
UNDERLINE="$PREFIX[4m"		# @underline
BLINKING="$PREFIX[5m"		# @blinking
REVERSE="$PREFIX[7m"		# @reverse

BLACK="$PREFIX[30m"			# @black
RED="$PREFIX[31m"			# @red
GREEN="$PREFIX[32m"			# @green
YELLOW="$PREFIX[33m"		# @yellow
BLUE="$PREFIX[34m"			# @blue
PURPLE="$PREFIX[35m"		# @purple
CYAN="$PREFIX[36m"			# @cyan | @aqua
GREY="$PREFIX[37m"			# @grey

BACKGROUND_BLACK="$PREFIX[40m"			# @background.black		> @b.black
BACKGROUND_RED="$PREFIX[41m"			# @background.red		> @b.red
BACKGROUND_GREEN="$PREFIX[42m"			# @background.green		> @b.green
BACKGROUND_YELLOW="$PREFIX[43m"			# @background.yellow	> @b.yellow
BACKGROUND_BLUE="$PREFIX[44m"			# @background.blue		> @b.blue
BACKGROUND_PURPLE="$PREFIX[45m"			# @background.purple	> @b.purple
BACKGROUND_CYAN="$PREFIX[46m"			# @background.cyan		> @b.cyan
BACKGROUND_GREY="$PREFIX[47m"			# @background.grey		> @b.grey


# if target file is empty
if [ -z $target ]; then
	_error "no file specified"
	exit 1
fi

# if target file was not found
if [ ! -f $target ]
then
	_error "file($target) is not found"
	exit 1
fi

result=`sed $OPTSED -e '
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

# if result output sed is not empty
if [ ! -z "$result" ]; then
	echo -e "$result"
fi

exit 0

