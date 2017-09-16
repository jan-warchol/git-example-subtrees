export FZF_HOME=$HOME/.fzf

# Setup fzf
# ---------
if [[ ! "$PATH" == *$FZF_HOME/bin* ]]; then
  export PATH="$PATH:$FZF_HOME/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$FZF_HOME/shell/key-bindings.bash"

export FZF_ALT_C_OPTS="--preview 'tree -C -L 2 --dirsfirst {} | head -200'"

# fuzzy-search in all files (including hidden)
bind -x '"\C-u\C-a": "FZF_CTRL_T_COMMAND=find fzf-file-widget"'

# bindings for git - see functions defined in fzf-git-functions.sh
bind '"\er": redraw-current-line'
bind '"\C-g\C-f": "$(gf)\e\C-e\er"'
bind '"\C-g\C-b": "$(gb)\e\C-e\er"'
bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
bind '"\C-g\C-s": "$(g_stash)\e\C-e\er"'
bind '"\C-g\C-g": "__fzf_git_checkout__\n"'
