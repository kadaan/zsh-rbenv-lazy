# Lazy load rbenv
export RBENV_ROOT="${RBENV_ROOT:=${HOME}/.rbenv}"
if ! type rbenv > /dev/null && [ -f "${RBENV_ROOT}/bin/rbenv" ]; then
    export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

if type rbenv &> /dev/null; then
  local RBENV_SHIMS="${RBENV_ROOT}/shims"
  export PATH="${RBENV_SHIMS}:${PATH}"
  source ${RBENV_ROOT}/completions/rbenv.zsh
  function rbenv() {
    unset -f rbenv > /dev/null 2>&1
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi

