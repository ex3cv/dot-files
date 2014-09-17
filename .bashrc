# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

WHITE="\[\033[0;37m\]" 
GREEN="\[\033[0;32m\]" 
RED="\[\033[0;31m\]" 
CYAN="\[\033[0;36m\]"
BOLD="\[\033[1m\]" 
BOLDEND="\[\033[0m\]" 

function git_prompt () {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi
 
    git_branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p') 
    echo "$RED[$CYAN${git_branch}$RED]"
}

PROMPT_COMMAND='PS1="$RED$BOLD[$WHITE\t$RED][$WHITE\u@\h$RED][$WHITE\w$RED]$(git_prompt)$RED[$GREEN\$?$RED]$WHITE\\\$$RED> $BOLDEND"'
#export TERM=xterm 
export PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/opt/VRTSvcs/bin" 

alias auth="view ~/.auth.aes" 
alias authedit="vim ~/.auth.aes" 
alias s="sudo bash" 
#alias tmux="LD_LIBRARY_PATH=/home/s3h2es/fake_root/linux/lib/ /home/s3h2es/fake_root/linux/bin/tmux" 
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias dmesg='dmesg -T'
alias aptu='sudo apt-get update'
alias aptug='sudo apt-get upgrade'
alias aptudg='sudo apt-get dist-upgrade'

function pwgen() { 
        local l=$1 
        [ "$1" == "" ] && l=8 
        tr -dc [:graph:] < /dev/urandom | head -c $l | xargs 
}

function vir {
	[ -f RCS/"$1",v ] && { rcsdiff -q "$1" > /dev/null || { echo 'Ups ups... someone forgot co/ci !!!'; return 1; }; };
	co -l "$1" || { ci "$1"; co -l "$1"; };
	/usr/bin/vim "$1";
	ci -u "$1";
}

function vacuum-firefox-databases () {
	#Check if Firefox is running
	ps -ef | grep firefox | grep -v grep > /dev/null && echo "Close all Firefox instances before issuing this command" && return
	for i in ~/.mozilla/firefox/*/*.sqlite; do
		oldsize=`ls -lh $i | awk '{print $5}'`
		printf '%25s: %4s\t' `basename $i` $oldsize
		sqlite3 $i VACUUM
		ls -lh $i | awk '{print $5}'
	done
}

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

w >&2
