# Zplugin Console

A consolette for Zplugin – based on the `zsh/zcurses` Zshell module and the
[ZUI](https://github.com/zdharma/zui) library – it allows the user to:

- view the currently loaded plugins in a colorful list, in one of 3 different
  display modes,
- unload and load plugins,
- delete the plugins and snippets from the disk.

## Usage

Start the consolette by Ctrl-O Ctrl-J keyboard shortcut, or by running
`zpconsole` function in the shell. Then, in the consolette:

| Key(s) | Description |
|--------|-------------|
| `Ctrl-U`,`Ctrl-D` | Half page up; half page down                             |
| `Ctrl-P`,`Ctrl-N` | Previous line, centered; next line, centered             |
| `Ctrl-L` | Redraw of whole display                                           |
| `[`, `]` | Jump to next and previous section (e.g.: next plugin or snippet)  |
| `g`, `G` | Jump to beginning and end of whole interface                      |
| `<`,`>` or `{`,`}` | Horizontal scroll (i.e.: left or right)                 |
| `/`      | Show incremental search                                           |
| `F1`     | Jump to result (in incremental search) and back                   |
| `Esc`    | Exit incremental search, clearing query                           |
| `Ctrl-W` | Delete whole word (in incremental search)                         |
| `Ctrl-K` | Delete whole line (in incremental search)                         |

## Screencast

[![asciicast](https://asciinema.org/a/272994.svg)](https://asciinema.org/a/272994)

## Installation

Load like any other normal plugin, e.g.:, with use of [Turbo
mode](http://zdharma.org/zplugin/wiki/INTRODUCTION/#turbo_mode_zsh_62_53):

```zsh
zplugin ice wait lucid
zplugin load zplugin/zplugin-console
```

<!-- vim:set ft=markdown tw=80 fo+=an1 autoindent: -->
