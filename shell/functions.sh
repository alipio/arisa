# vim: ft=sh fdm=marker

# Create a new directory and enter it
take() {
  mkdir -p "$@" && cd "$_"
}

fco() {
  git branch --no-color --sort=-committerdate --format='%(refname:short)' \
    | grep -vxF "$(git branch --show-current)" \
    | fzf --no-multi \
    | ifne xargs git checkout
}

uuid() {
  uuidgen | tr '[:upper:]' '[:lower:]' | tr -d '\n' | tee >(wl-copy); printf "\n"
}

# Simple webserver
serve() {
  python -m http.server "${1:-8081}"
}
