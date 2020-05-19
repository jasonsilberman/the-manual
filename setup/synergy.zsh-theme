source $ZSH_CUSTOM/gitstatus/gitstatus.plugin.zsh

# Sets GITSTATUS_PROMPT to reflect the state of the current git repository (empty if not
# in a git repository).
function update_gitstatus() {
  emulate -L zsh
  typeset -g GITSTATUS_PROMPT=""

  # Call gitstatus_query synchronously. Note that gitstatus_query can also be called
  # asynchronously; see documentation in gitstatus.plugin.zsh.
  gitstatus_query MY                  || return 1  # error
  [[ $VCS_STATUS_RESULT == ok-sync ]] || return 0  # not a git repo

  local     reset="%f"       # no foreground
  local     clean="%{$fg[blue]%}"  # blue foreground
  local untracked="%{$fg[red]%}"  # red foreground
  local  modified="%{$fg[red]%}"  # red foreground
  local  remote="%{$fg[green]%}"  # green foreground

  local p
  p+=$clean
  p+=${${VCS_STATUS_LOCAL_BRANCH:-@${VCS_STATUS_COMMIT}}//\%/%%}            # escape %

  [[ -n $VCS_STATUS_TAG               ]] && p+="#${VCS_STATUS_TAG//\%/%%}"  # escape %
  [[ $VCS_STATUS_HAS_STAGED      == 1 ]] && p+="${modified}+"
  [[ $VCS_STATUS_HAS_UNSTAGED    == 1 ]] && p+="${modified}!"
  [[ $VCS_STATUS_HAS_UNTRACKED   == 1 ]] && p+="${untracked}?"
  [[ $VCS_STATUS_COMMITS_AHEAD  -gt 0 ]] && p+="${remote} ⇡${VCS_STATUS_COMMITS_AHEAD}"
  [[ $VCS_STATUS_COMMITS_BEHIND -gt 0 ]] && p+="${remote} ⇣${VCS_STATUS_COMMITS_BEHIND}"

  GITSTATUS_PROMPT="${reset}${p}"
}

function update_prompt() {
    PROMPT="%{$fg[cyan]%}λ %{$fg[magenta]%}%c" # λ current directory
    PROMPT+="${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT}" # git status (requires promptsubst option)
    PROMPT+=" %{$fg[yellow]%}→ %{$reset_color%}" # →
}

# Start gitstatusd instance with name "MY"
gitstatus_stop MY && gitstatus_start MY

# On every prompt, fetch git status and set GITSTATUS_PROMPT.
autoload -Uz add-zsh-hook
add-zsh-hook precmd update_gitstatus
add-zsh-hook precmd update_prompt

# Enable/disable the right prompt expansions.
setopt nopromptbang prompt{percent,subst}
