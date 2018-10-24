# add brew installed packages to the python path
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
# select qt as default toolkit
export PATH=/Applications/Julia-0.6.app/Contents/Resources/julia/bin:$PATH

# install bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#some useful alias'
#alias vi="open -a macvim"
#alias jot="open -a macvim ~/sync/notes"
#alias jnb="ipython notebook --profile julia"
alias grep='grep --color=auto --exclude-dir={.ropeproject,.git}'
alias vpn_clients='ssh vpn "/home/openvpnas/client_list"'

#add current git branch to bash prompt
function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
PS1="$GREEN\u$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

# enable git tab completion in bash
#source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

#colored ls output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#stolen from ubuntu
alias ls="ls -GpFh"
alias ll="ls -GpFhl"
alias la="ls -GpFha"

# setup rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# added by Anaconda2 4.1.1 installer
export PATH="/Users/jack/anaconda2/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
PATH="~/Library/Python/3.6/bin:${PATH}"
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
