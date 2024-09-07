SESSION_NAME="aono"

if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
	if tmux has-session -t ${SESSION_NAME}; then
		tmux attach -t ${SESSION_NAME} && exit
	else
		tmux new -s ${SESSION_NAME} && exit
	fi
fi

