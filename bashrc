# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Recursive globbing with "**"
if [ ${BASH_VERSINFO[0]} -ge 4 ]; then
  shopt -s globstar
fi

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Do not autocomplete when accidentally pressing Tab on an empty line.
shopt -s no_empty_cmd_completion

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Search the PATH again if an executable is not found where it was last time.
# This can happen when ./bin is in your PATH and you change directory.
shopt -s checkhash

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
# export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# History
export HISTSIZE=10000
export HISTFILESIZE="${HISTSIZE}"

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL=ignoreboth

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Custom aliases and functions
. ~/.shell/functions.sh
. ~/.shell/aliases.sh

# Use bash-completion, if available, and avoid double-sourcing
[[ ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

eval "$(zoxide init bash)"
eval "$(starship init bash)"

stty -ixon

if [[ -r ~/.bashrc.local ]]; then
  . ~/.bashrc.local
fi
