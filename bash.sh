export PATH=~/bin:$PATH

[ -d ~/.bash_completion.d ] && source ~/.bash_completion.d/*

export PS1='\u: \w$(__git_ps1 "(%s)")\$ '
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias grep="grep --exclude 'tmp'"

set -o vi
set editing-mode vi
set keymap vi

export set PATH=$PATH:~/code/android/sdk/tools:~/code/android/sdk/platform-tools
alias vi=vim
export set EDITOR="vim -X"
alias tm="tmux -2 attach -d"
