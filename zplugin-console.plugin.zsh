#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {where-zplugin-view-is}/zplugin-view.plugin.zsh
#
# to ~/.zshrc. But of course, this plugin is an extension to Zplugin.
#

# Standarized $0 handling
# http://zdharma.org/zplugin/wiki/zsh-plugin-standard/
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

export ZPCONSOLE_REPO_DIR="${0:h}"

if [[ "${+functions[-zui_std_cleanup]}" = "0" ]]; then
    echo "The zplugin consolette uses ZUI plugin, please load https://github.com/zdharma/zui/ with your plugin manager, or source it."
fi

#
# Update FPATH if:
# 1. Not loading with Zplugin or other plugin manager supporting the plugin standard
# 2. Not having fpath already updated (that would equal: using other plugin manager)
#

if [[ $zsh_loaded_plugins[-1] != */zplugin-console && -z $fpath[(r)${0:h}] ]]
then
    fpath+=( "${0:h}" )
fi

[[ -z "${fg_bold[green]}" ]] && builtin autoload -Uz colors && colors

autoload -- zpconsole

zle -N zpconsole
bindkey "^O^J" zpconsole

# vim:ft=zsh
