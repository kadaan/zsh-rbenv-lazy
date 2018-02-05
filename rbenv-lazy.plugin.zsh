# Lazy load rbenv
if type rbenv &> /dev/null; then
  local RBENV_SHIMS="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
  export PATH="${RBENV_SHIMS}:${PATH}"
  source $(which rbenv)/../../completions/rbenv.zsh
  function rbenv() {
    unset rbenv
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi
