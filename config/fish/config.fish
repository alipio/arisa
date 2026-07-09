set fish_greeting

### Aliases
alias ..='cd ..'
alias ...='cd ../..'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lGAhF'
alias lt='ls -lGAhFtr'

alias grep='grep --color=auto'
alias open='xdg-open'
alias pacman='sudo pacman'
alias sctl='sudo systemctl'
alias se='sudoedit'
# alias vim='nvim'
alias xt='extract'

alias g='git'
alias gbr='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'

alias gd='git diff'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gu='git pull --recurse-submodules'

alias gri='git rebase -i'
alias gc='git commit'
alias gcm='git commit -m'
alias gst='git status -sb'
alias ga='git add'

zoxide init fish | source
starship init fish | source

fish_config theme choose tokyonight_storm
