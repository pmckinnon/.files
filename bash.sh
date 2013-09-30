export PATH=~/bin:$PATH

if [ -d ~/.bash_completion.d ]; then
  source ~/.bash_completion.d/git-prompt.sh
  source ~/.bash_completion.d/git-completion.bash
fi

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

function cleanup_branches {
  git branch --merged | grep -v \"\*\" | grep -vw master | xargs -n 1 git branch -d
  git remote prune origin
}

function track_remote {
  BRANCH=`git rev-parse --abbrev-ref HEAD`
  git branch --set-upstream-to=origin/$BRANCH $BRANCH
}

alias gen_passwd="openssl rand -base64 32"
