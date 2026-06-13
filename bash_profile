export LC_COLLATE=C.UTF-8
export EDITOR='nvim'
export PAGER='less'
export MANPAGER='nvim +Man!'
export LESS='-iMRS -x4'
export LESSHISTFILE=-
# export LS_COLORS='bd=33:cd=33:di=34:or=3;31:ow=4;34:pi=35:sg=1;4;33:so=35:st=1;34:su=1;4;33:tw=1;4;34:'

# Set colors for ls
[ -f ~/.dircolors ] && . <(dircolors ~/.dircolors)

# fzf settings
export FZF_DEFAULT_OPTS="\
--height 40% \
--border \
--marker='✚' \
--pointer='▶' \
--prompt='❯ ' \
--no-separator \
--scrollbar='▐'"

# Wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

export NO_AT_BRIDGE=1
export MOZ_USE_XINPUT2=1

path_prepend() {
  for arg in "$@"
  do
    if [ -d "$arg" ] && [[ ":$PATH:" != *":$arg:"* ]]; then
      PATH="$arg${PATH:+":$PATH"}"
    fi
  done
}

path_prepend "$HOME/.local/bin" "$HOME/.dotfiles/bin" "$HOME/.asdf/shims"

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec ssh-agent sway > /var/log/sway.log 2>&1
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
