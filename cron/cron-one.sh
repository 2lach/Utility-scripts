#!/bin/sh

# setup logfile and place it on desktop
# runs on mondays and thursdays
touch /Users/z/Desktop/cron-one.log
cron_log=/Users/z/Desktop/cron-one.log
LOG_FILE="$cron_log"
exec 3>&1 1>>${LOG_FILE} 2>&1

echo "-----------"
echo "cron one (homeBrew updates) started at:"
date
echo "-----------"
echo "-----------"

# setup vars
brew="/usr/local/bin/brew"
mas="/usr/local/bin/mas"

echo ""
echo "brew updates"
echo "-----------"
$brew update --verbose
$brew upgrade --verbose
$brew cask upgrade --verbose
echo "-----------"
echo "-----------"

echo ""
echo "mas updates"
echo "-----------"
$mas upgrade
echo "-----------"
echo "-----------"

echo ""
echo "brew clean"
echo "-----------"
$brew cleanup --prune=2 --verbose
echo "-----------"
echo "-----------"

echo ""
echo "brew doctor"
echo "-----------"
$brew doctor -v
echo "-----------"
echo "-----------"

echo ""
echo "removing .DS_Store files"
echo "-----------"
/usr/bin/find /Users/z -type f -name '*.DS_Store' -ls -delete
find . -type f -name '*.DS_Store' -ls -delete
echo "-----------"
echo "-----------"

echo ""
echo "cronjob done:"
date
