# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

setup_antigen() {
    antidote load $ZSH_CONFIG_DIR/.zsh_plugins.txt
}

setup_ranger() {
	alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
}

setup_history() {
	HISTFILE=~/.histfile
	HISTSIZE=10000
	SAVEHIST=2000
}

setup_darwin_rustup() {
    export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
}

setup_darwin() {
    source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

	export EDITOR=nvim

	setup_antigen
	setup_ranger
	setup_history
    setup_darwin_rustup
}

setup_linux() {
	export EDITOR=nvim

	setup_antigen
	setup_ranger
	setup_history
}

OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
	setup_darwin
elif [ "$OS" = "Linux" ]; then
	setup_linux
fi
