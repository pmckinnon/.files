export PATH=~/bin:$PATH

[ -d ~/.bash_completion.d ] && source ~/.bash_completion.d/*

export PS1='\u: \w$(__git_ps1 "(%s)")\$ '
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias grep="grep --exclude 'tmp'"

set -o vi
set editing-mode vi
set keymap vi

export set ANDROID_HOME=~/code/android/sdk
export set PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
alias vi=vim
export set EDITOR="vim -X"
alias tm="tmux -2 attach -d || tmux"
