export PATH=~/bin:/usr/local/bin:/home/prm/packages/jdk/bin:$PATH
export PYTHONPATH=.:$PYTHONPATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH:/Users/prm/.bin
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

if [ $(command -v brew) ]; then
  if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    . ~/.git-completion.bash
  elif [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  elif [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
    . /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
  fi
fi

if [ -f ~/.kube/completion ]; then
  . ~/.kube/completion
fi

if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
fi

#export PS1='\u@\[\033[1;34m\]\h\[\033[0m\]: \w$(__git_ps1 "(%s)")\$ '
export PS1='\u@\[\033[1;34m\]\h$(__git_ps1 "\[\033[0m\](\[\033[1;36m\]%s\[\033[0m\])")\[\033[0m\]: \w\[\033[1;33m\]\$\[\033[0m\] '
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias grep="grep -I --exclude 'templates.js' --exclude 'app.js' --exclude 'tags' --exclude 'tmp' --exclude-dir '.git' --exclude-dir '.svn'"

set -o vi
set editing-mode vi
set keymap vi

export set ANDROID_HOME=~/Documents/android
export set PATH=$PATH:$ANDROID_HOME/platform-tools
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

#complete -C '/usr/bin/aws_completer' aws
complete -C '/usr/local/aws/bin/aws_completer' aws
# TODO: Write script to convert from 'https://github.com/pmckinnon/.files' style origin to 'github.com:pmckinnon/.files.git'
alias jsonp="python -m json.tool"

alias dns_clear="sudo dscacheutil -flushcache"
alias cps_forward="kubectl get pods | grep customer | head -n1 | awk '{print $1}' | xargs -I{} kubectl port-forward {} 8000:8000"

alias json="echo $1 | jq"
