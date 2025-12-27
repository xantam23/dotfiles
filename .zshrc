# vim:filetype=zsh foldmethod=marker autoindent expandtab shiftwidth=4

# Lade Farben und passe die Shellpromt an
autoload -U colors && colors
if [[ $EUID -ne 0 ]]; then
        PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[yellow]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
else
        PS1="%B%{$fg[red]%}[%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
fi

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Besseres Tabvervollständigen
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Zeichne fastfetch beim start
fastfetch

# Smartes durchsuchen der zsh_history (Durchsuche nur den Teil der nach dem Cursor anders ist)
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-beginning-search-forward

#. /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Autovervollständigen
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/usr/local/sbin:$PATH"

# Wir wollen VIM als Default Editor
export VISUAL="/usr/local/bin/vim"
export EDITOR="$VISUAL"

# Lade den Alias kram (zB. l statt ls -laG)
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Syntax Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
