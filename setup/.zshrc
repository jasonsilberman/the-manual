export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="synergy"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias g-s='git status'
alias g-p='git push'
alias g-c='git add --all && git commit -a -S'

alias o='open .'
alias r!='source ~/.zshrc'
alias wrk='cd ~/WORK/'

eval "$(rbenv init -)"


export VOLTA_HOME="$HOME/.volta"
grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"

export PATH=${PATH}:$HOME/gsutil
