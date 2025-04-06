# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/aonosomeday/completions:"* ]]; then export FPATH="/home/aonosomeday/completions:$FPATH"; fi
### PATH
# Golang
export PATH=$PATH:$HOME/go/bin
### End of PATH

### gpg-agent setup
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye>/dev/null

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
### End of gpg-agent setup

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aonosomeday/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### Zinit packages
# zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858"
zinit light zsh-users/zsh-autosuggestions
# zsh-completions
zinit light zsh-users/zsh-completions
### End of Zinit packages

### Starship
eval "$(starship init zsh)"
### End of Starship setup

### Functions
function ghq_peco {
	local dir="$( ghq list -p | peco )"
	if [ ! -z "$dir" ] ; then
		cd "$dir"
	fi
}
alias gp="ghq_peco"
alias gpc="ghq_peco && code ."
### End of functions

### tmux
SESSION_NAME="aono"

if [[ "$ENABLE_TMUX" = "1" ]] && [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
	if [[ "$OPEN_HOMEDIR" = "1" ]]; then
		cd /home/aonosomeday
	fi

	echo a

	if tmux has-session -t ${SESSION_NAME}; then
		tmux attach -t ${SESSION_NAME} && exit
	else
		tmux new -s ${SESSION_NAME} && exit
	fi
fi
### End of tmux startup

. "/home/aonosomeday/.deno/env"

