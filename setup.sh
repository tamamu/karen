#!/bin/bash

KAREN_DIR=`dirname $0`
ROSWELL_DIR="roswell"

atexit() {
	[[ -n $TMPDIR ]] && rm -rf "$TMPDIR"
}

# Move to Karen directory
cd $KAREN_DIR

# Install Roswell
if type ros > /dev/null 2>&1; then
	ROSWELL="ros"
else
	if ! [ -e $ROSWELL_DIR ]; then
		mkdir $ROSWELL_DIR
		TMPDIR=`mktemp -d`
		trap atexit EXIT
		trap 'trap - EXIT; atexit; exit -1' SIGHUP SIGINT SIGTERM
		cd $TMPDIR
		git clone -b release https://github.com/roswell/roswell.git
		cd roswell
		sh bootstrap
		./configure --prefix $KAREN_DIR/$ROSWELL_DIR/
		make && make install
	fi
	ROSWELL="roswell/bin/ros"
fi

echo $ROSWELL
