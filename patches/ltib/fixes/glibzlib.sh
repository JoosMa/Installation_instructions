#!/bin/bash

# this Script is remedy for error caused by zlib or glibc-devel.during ltib build on 11.10 host

# CMC LTD --2012
# GPL
# vijaykumar.pulluri@gmail.com

# Please go through the Readme file provided in the directory before running these Script files.

# variables

ltibPath=".../ltib"
FILE="Ltibutils.pm"
# look for the ltib path provided or not if provided re assinging to ltibPath
if [ -n "$1" ]
then
   ltibPath=$1
fi

usage()
{
   echo "USE IN THIS WAY : ./`basename $0` <provide correct ltib path>"
   exit -1
}


# checking for the ltib directory
if [ ! -d $ltibPath ]; then
    echo "Path Not found"
    usage
fi

#defining ltibutil variable
ltibUtil="$ltibPath/bin"
# Replacing the Ltibutils.pm
sudo rm -rf $ltibUtil/Ltibutils.pm
cp $FILE $ltibUtil/Ltibutils.pm
echo "DONE"


# Provides link if running on a 64bit host
if uname -a|grep -sq 'x86_64'; then
	if [ ! -e /usr/include/sys ]; then
		sudo ln -s /usr/include/x86_64-linux-gnu/sys /usr/include/sys
	fi
fi


