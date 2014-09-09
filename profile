# add brew installed packages to the python path
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
# select qt as default toolkit
export ETS_TOOLKIT=qt4
export PATH=/Applications/Julia-0.3.0-prerelease-3e6a6c7bd8.app/Contents/Resources/julia/bin:$PATH

#some useful alias'
alias vi="open -a macvim"
alias jot="open -a macvim ~/sync/notes"

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
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

#colored ls output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#stolen from ubuntu
alias ls="ls -GpFh"
alias ll="ls -GpFhl"
alias la="ls -GpFha"

#easily activate the canopy venv
alias "canopy-activate"="source ~/Library/Enthought/Canopy_64bit/User/bin/activate"
canopy-activate
