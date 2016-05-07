# Completion
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''

autoload -Uz compinit
compinit

# History file
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd

# Vi keybinding
bindkey -v

# fix locale
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL"

# allow colors
autoload -U colors && colors
# allow substitution (needed for git)
setopt PROMPT_SUBST

# git prompt (options must be set to empty to disable)
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
	vcs_info
}
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats " (%b)"

# fix del key
bindkey "^[[3~" delete-char

# variables
export MAIL="pierre@bondoer.fr"
export PROMPT=' %B%n%b@%U%m%u:%S%c%s%{$fg[yellow]%}${vcs_info_msg_0_} %{$reset_color%}%# '
export RPROMPT='%t'
export EDITOR="vim"

# 42 variables
export USER_42="pbondoer"
export MAIL_42="pbondoer@student.42.fr"

# fortune
fortune ~/fortune
#gshuf -n 1 .quotes | sed 's/\\n/\'$'\n/g'
#cat .quotes | perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);' | tail -1 | sed 's/\\n/\'$'\n/g'
echo ""

# reminders
if [ -f ~/.reminders ]
then
	reminder_lines=`wc -l < ~/.reminders | tr -d ' \t\n\r\f'`
	echo "--- You have [$reminder_lines] reminders"
	while read line; do
		echo "*" $line
	done < ~/.reminders
	echo ""
fi

# gpg alias
# alias gpg=gpg2
# size alias
alias size="du -ch -d 1 | gsort -h"
# <3 from lemon
