#!/bin/bash

echo "Running clearing disk space script"

if hash trash 2>/dev/null; then
  cmd="trash"
else
  while true; do
    read -p "Using 'rm -rf' to clear disk space, do you want to proceed? (y/n)" yn
    case $yn in
      [Yy]*)
        echo 'Alrite, buckle your seatbelt dorothy, because kansas is going bye-bye'
        break
        ;;
      [Nn]*)
        echo 'aborting'
        exit
        ;;
      *) echo "Please answer yes or no." ;;
    esac
  done
  cmd="rm -rf"
fi

# won't last long but will give you 1G.
# sudo rm /private/var/vm/sleepimage

# Clean up system logs and temporary files
#   http://www.thexlab.com/faqs/maintscripts.html
sudo periodic daily weekly monthly

# remove old homebrew versions
brew cleanup -n # to see what would get cleaned up
brew cleanup    # to do it.

# Browser cache
$cmd "$HOME"/Library/Caches/BraveSoftware/Brave-Browser/Default/Cache
$cmd "$HOME"/Library/Caches/Google/Chrome Canary/Default
$cmd "$HOME"/Library/Caches/Google/Chrome/Default

# XCODE
# kill cache
$cmd ~/Library/Caches/com.apple.dt.Xcode/*
# remove devices for runtimes that are no longer supported
xcrun simctl delete unavailable
# simulation cache
$cmd ~/Library/Developer/CoreSimulator/Caches

if hash trash 2>/dev/null; then
  echo "you can now empty the trash"
else
  echo "all has been removed"
fi
