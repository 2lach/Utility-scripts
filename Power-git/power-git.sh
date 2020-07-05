#!/bin/bash

##############################################################################
#	Power-git
# ORIGINAL
#--------------------------------------------------------------------------------------------------------------------------------------------------
#	Gives the user the power to run pretty much any (git) command(s) 
# and apply it to every git repo on his/her machine
#  
# However Beware: 
# "With great power comes great responsibility" - Uncle Ben
# 
# And make no mistake Power-git is powerful stuff!
# So think twice before using, and then have fun :smiley
#--------------------------------------------------------------------------------------------------------------------------------------------------
#
#	:author: Stefan Lachmann, <2lach>
#	:date: 10 april 2020
#	:version: 0.0.1
# 
#--------------------------------------------------------------------------------------------------------------------------------------------------
#
# Usage:
#	    $ power-git <git-command>
#     $ power-git -p <path> <git-command>
#
# Examples:
#       simple usage:
#	      $ power-git status
#       will list the status of all git repos on computer (starting from $HOME)
#     
#       $ power-git branches
#       will list all local and remote branches on computer
#
#       $ power-git path/to/a/specific/workspace fetch
#       will fetch from remote in all repos in path
#
#       $ power-git <do-any-git-command-or-alias-you-want>
#
##############################################################################
# -e  Exit immediately if a command exits with a non-zero status.
set -e

# -o pipefail: prevent piping from causing non-zero exit codes to be ignored.
set -o pipefail


# DESSA BEHÖVER FIXAS!
# https://www.jquery-az.com/list-branches-git/
#   commands:
#      subcommands 
#	  branches:
#      list   > $ git show-branch -a --list --topics | Expect : It shows branches and lastest commits for remotes and master
#      local = git show-branch --list --current
#       remote or both
# 	status:
#      get all statuses
#	  fetch: 
#      fetch for all projects
#   *dealers choise*	


############################################
# ❯ howdoi see only lastest commit done by a user
# git log --author="Jon"


## Helpers ##

# Check if command exists in $PATH
# USAGE:
#   _exists <command>
_exists() {
  command -v $1 > /dev/null 2>&1
}


## main ##
function Power-Git(){

# decide searchUtils
  # 1) ripgrep
  # 2) silver searcher ag
  # 3) grep 
  # 4) find

local searchUtil
  
if _exists find; then
    searchUtil=$(find 2>/dev/null)
    $searchUtil ~ -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | awk '{print "-------------------------\n\033[1;32mGit Repo:\033[0m " $1; system("git --git-dir="$1".git --work-tree="$1"' + "$@"+ '")}'
else
    echo "issues with searchUtils"
  return
fi



# -------------------------------------------------------------------------------------
  # fastest searchers ripgrep, ag & grep as a last resort
  # https://github.com/BurntSushi/ripgrep
  # if _exists ripgrep; then
  # $searchUtil ~ -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | awk '{print "-------------------------\n\033[1;32mGit Repo:\033[0m " $1; system("git --git-dir="$1".git --work-tree="$1" status")}'
# -------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------
  # https://github.com/ggreer/the_silver_searcher/blob/master/_the_silver_searcher
  # if _exists ag; then
  #  searchUtil=$(ag 2>/dev/null) 
  #  $searchUtil ~ -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | awk '{print "-------------------------\n\033[1;32mGit Repo:\033[0m " $1; system("git --git-dir="$1".git --work-tree="$1"' + "$@"+ '")}'
# -------------------------------------------------------------------------------------

}

# List all local branches # this shows both local and remote
function power-git-local-branches(){
  find ~ -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | awk '{print "-------------------------\n\033[1;32mGit Repo:\033[0m " $1; system("git --git-dir="$1".git --work-tree="$1" branches | grep -v ‘local’")}'
}

# List all remote branches
function power-git-local-branches(){
  find ~ -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | awk '{print "-------------------------\n\033[1;32mGit Repo:\033[0m " $1; system("git --git-dir="$1".git --work-tree="$1" branches | grep -v remote")}'
}


function power-git-cmd-complete(){
  # 1) new line and notify completed
  # 2) the time it took and what searchUtil was used
  # 3) ?
}

## Backup of original function
#
# function git-status-all-repos(){
# find ~ -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | awk '{print "-------------------------\n\033[1;32mGit Repo:\033[0m " $1; system("git --git-dir="$1".git --work-tree="$1" status")}'
# }
