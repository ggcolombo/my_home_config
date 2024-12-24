# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# git aware bash
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\W\[$txtgrn\]\$git_branch\[$bldred\]\$git_dirty\[$txtrst\]\> "

#export PS1="\[$bldgrn\]\u@\h\[$txtrst\] \W \[$bldylw\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\$ "


export HISTSIZE=1000000

# virtualen wrapper requirements
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
source /usr/bin/virtualenvwrapper.sh

# . bashrcd

# set terminal title to "ssh $host"
ssh()
{
  SSHAPP=`which ssh`
  ARGS=$@
  echo -en "\033]0;ssh $ARGS\007"
  $SSHAPP $ARGS
}

gs_set_title() {
    CMD="gs_set_title"
    # Help menu
    if [ "$1" == "-h" ] || [ "$1" == "-?" ]; then
        echo "Set the title of your currently-opened terminal tab."
        echo "Usage:   $CMD any title you want"
        echo "   OR:   $CMD \"any title you want\""
        echo "   OR (to make a dynamic title which relies on variables or functions):"
        echo "         $CMD '\$(some_cmd)'"
        echo "     OR  $CMD '\${SOME_VARIABLE}'"
        echo "Examples:"
        echo "         1. static title"
        echo "           $CMD my new title"
        echo "         2. dynamic title"
        echo "           $CMD 'Current Directory is \"\$PWD\"'"
        echo "       OR  $CMD 'Date and time of last cmd is \"\$(date)\"'"
        return $EXIT_SUCCESS
    fi

    TITLE="$@"
    # Set the PS1 title escape sequence; see "Customizing the terminal window title" here:
    # https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Customizing_the_terminal_window_title
    ESCAPED_TITLE="\[\e]2;${TITLE}\a\]"

    # Delete any existing title strings, if any, in the current PS1 variable. See my Q here:
    # https://askubuntu.com/questions/1310665/how-to-replace-terminal-title-using-sed-in-ps1-prompt-string
    PS1_NO_TITLE="$(echo "$PS1" | sed 's|\\\[\\e\]2;.*\\a\\\]||g')"
    PS1="${PS1_NO_TITLE}${ESCAPED_TITLE}"
}

