export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="/opt/homebrew/bin:$PATH"
source ~/.bashrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
