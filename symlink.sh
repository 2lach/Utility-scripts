#!/bin/bash

echo "--------------------------------------------------"
echo "setup symlinks"
echo "--------------------------------------------------"

mkdir ~/utility-scripts

dotfilesDir=$(pwd)

function linkDotfile() {
	dest="${HOME}/utility-scripts/${1}"
	dateStr=$(date +%Y-%m-%d-%H%M)

	if [ -h ~/${1} ]; then
		# Existing symlink
		echo "Removing existing symlink: ${dest}"
		rm ${dest}

	elif [ -f "${dest}" ]; then
		# Existing file
		echo "Backing up existing file: ${dest}"
		mv ${dest}{,.${dateStr}}

	elif [ -d "${dest}" ]; then
		# Existing dir
		echo "Backing up existing dir: ${dest}"
		mv ${dest}{,.${dateStr}}
	fi

	echo "Creating new symlink: ${dest}"
	ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile clearing-disk-space.sh
linkDotfile common-things.sh
linkDotfile set-upstream.sh
linkDotfile upsampling-images.sh
linkDotfile wifi-password.sh

cp -rv cron ~/utility-scripts/

# mkdir ~/.z-local; link .z-local/* -> ~/-.z-local/
# ; link utility-scripts/* -> ~/utility-scripts/
# link /*

# backup com.googlecode.iterm2.plist
