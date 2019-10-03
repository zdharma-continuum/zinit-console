#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {where-zplugin-view-is}/zplugin-view.plugin.zsh
#
# to ~/.zshrc. But of course, this plugin is an extension to Zplugin.
#

0="${(%):-%N}" # this gives immunity to functionargzero being unset
export ZPVIEW_REPO_DIR="${0%/*}"

if [[ "${+functions[-zui_std_cleanup]}" = "0" ]]; then
    echo "ZPView uses ZUI plugin, please load https://github.com/zdharma/zui/ with your plugin manager, or source it."
fi

#
# Update FPATH if:
# 1. Not loading with Zplugin
# 2. Not having fpath already updated (that would equal: using other plugin manager)
#

if [[ -z "$ZPLG_CUR_PLUGIN" && "${fpath[(r)$ZPVIEW_REPO_DIR]}" != $ZPVIEW_REPO_DIR ]]; then
    fpath+=( "$ZPVIEW_REPO_DIR" )
fi

[[ -z "${fg_bold[green]}" ]] && builtin autoload -Uz colors && colors

autoload -- zpview -zpview-process-buffer

zle -N zpview
bindkey "^O^J" zpview

# vim:ft=zsh
