# History
HISTFILE=~/.zshistfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS

# Print time output if the command takes longer than 5 seconds
REPORTTIME=5

autoload -U compinit promptinit
compinit
promptinit

# Simple prompts
autoload -U colors && colors
# Don't show hostname at home
case $HOST in
	steef-archlinux)
		disphost=""
		;;
	amilo-arch)
		disphost=""
		;;
	*)
		disphost=@$HOST" "
		;;
esac

# I know my own name
case $USER in
	steef)
		dispuser=""
		;;
	*)
		dispuser=$USER
		;;
esac

# Left prompt
PROMPT="%F{blue}$dispuser$disphost%~ %#%f "
# Right prompt
RPROMPT="%F{blue}[%?] %T%f"

# Command not found hook (https://github.com/metti/command-not-found)
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

# Vi keybindings
bindkey -v

# Key bindings
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-search
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-search

# Finally, make sure the terminal is in application mode, when zle is active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
		printf '%s' "${terminfo[smkx]}"
	}
	function zle-line-finish () {
		printf '%s' "${terminfo[rmkx]}"
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

# ls colors
alias ls='ls --color=auto'

# youtube-dl audio only
alias yta='youtube-dl -x'

# less syntax highlighting
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

# Set some defaults
export EDITOR="vim"
export BROWSER="firefox"
export XDG_CONFIG_HOME="/home/steef/.config"

# List colors
alias lscolor='msgcat --color=test'

# Reload .Xresources
alias loadXres='[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources'

# This is war
alias info='info --vi-keys'
