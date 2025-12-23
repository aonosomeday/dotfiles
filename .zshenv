## Golang
export PATH="$PATH:$HOME/go/bin"
## Tex Live
texlive_path="/usr/local/texlive/2025"
export PATH="$PATH:$texlive_path/bin/x86_64-linux"
export MANPATH="$MANPATH:$texlive_path/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:$texlive_path/texmf-dist/doc/info"
## Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"
## Deno
. "$HOME/.deno/env"

