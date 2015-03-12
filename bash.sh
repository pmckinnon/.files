export PATH=~/bin:/usr/local/bin:~/packages/depot_tools:$PATH


export PS1='\u@\[\033[1;34m\]\h\[\033[0m\]: \w$(__git_ps1 "(%s)")\$ '
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias grep="grep -I --exclude 'templates.js' --exclude 'app.js' --exclude 'tags' --exclude 'tmp' --exclude-dir '.git' --exclude-dir '.svn'"

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

alias nat_discovery='java -cp ~/bin/NATCrackerDiscovery-0.1-SNAPSHOT-jar-with-dependencies.jar com.peerialism.natcracker.discovery.Main'

# TODO: Write script to convert from 'https://github.com/pmckinnon/.files' style origin to 'github.com:pmckinnon/.files.git'
