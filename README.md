# Zinit Console

A consolette for Zinit – based on the `zsh/zcurses` Zshell module and the [ZUI](https://github.com/zdharma/zui) library
– it allows the user to:

- view the currently loaded plugins in a colorful list, in one of 3 different display modes,
- unload and load plugins,
- delete the plugins and snippets from the disk.

## Usage

Start the consolette by Ctrl-O Ctrl-J keyboard shortcut, or by running `ziconsole` function in the shell. Then, in the
consolette:

| Key(s)             | Description                                                      |
| ------------------ | ---------------------------------------------------------------- |
| `Ctrl-U`,`Ctrl-D`  | Half page up; half page down                                     |
| `Ctrl-P`,`Ctrl-N`  | Previous line, centered; next line, centered                     |
| `Ctrl-L`           | Redraw of whole display                                          |
| `[`, `]`           | Jump to next and previous section (e.g.: next plugin or snippet) |
| `g`, `G`           | Jump to beginning and end of whole interface                     |
| `<`,`>` or `{`,`}` | Horizontal scroll (i.e.: left or right)                          |
| `/`                | Show incremental search                                          |
| `F1`               | Jump to result (in incremental search) and back                  |
| `Esc`              | Exit incremental search, clearing query                          |
| `Ctrl-W`           | Delete whole word (in incremental search)                        |
| `Ctrl-K`           | Delete whole line (in incremental search)                        |

## Screencast

[![asciicast](https://asciinema.org/a/272994.svg)](https://asciinema.org/a/272994)

## Installation

Load like any other normal plugin, e.g.:, with use of
[Turbo mode](https://zdharma-continuum.github.io/zinit/wiki/INTRODUCTION/#turbo_mode_zsh_62_53) and the
[for-syntax](https://zdharma-continuum.github.io/zinit/wiki/For-Syntax/):

```zsh
zinit wait lucid for zinit-zsh/zinit-console
```

The plugin needs `zsh/curses` Zsh module. You can check if it's available to your Zsh by executing:

```zsh
zmodload zsh/curses
```

If the call will return an error, then the `zsh/curses` module isn't available.

### Solving The Lack Of `zsh/curses` Module With Zinit

You can build the `zsh/curses`-equipped Zshell with Zinit by the following command:

```zsh
zinit ice id-as"zsh" atclone"./.preconfig
        CFLAGS='-I/usr/include -I/usr/local/include -g -O2 -Wall' \
        LDFLAGS='-L/usr/lib -L/usr/local/lib' ./configure --prefix='$ZPFX'" \
    atpull"%atclone" run-atpull make"install" pick"/dev/null"
zinit load zsh-users/zsh
```

The command will build a custom `zsh` and install it under `$ZPFX` (`~/.zinit/polaris` by default). The path `$ZPFX/bin`
is already added to `$PATH` by Zinit at first position, so starting `zsh` will run the new Zshell.

When on Gentoo, and possibly other systems, the `zsh` can still not have the ncurses library linked. To address this,
utilize the [z-a-patch-dl](https://github.com/zinit-zsh/z-a-patch-dl) annex and automatically patch the source first:

```zsh
zinit light zinit-zsh/z-a-patch-dl
zinit ice id-as"zsh" atclone"./.preconfig
        CFLAGS='-I/usr/include -I/usr/local/include -g -O2 -Wall' \
        LDFLAGS='-L/usr/lib -L/usr/local/lib' ./configure --prefix='$ZPFX'" \
    dl"https://gist.githubusercontent.com/psprint/2373494c71cb6d1529344a2ed1a64b03/raw -> curses.patch" \
    patch'curses.patch' atpull"%atclone" reset \
    run-atpull make"install" pick"/dev/null"
zinit load zsh-users/zsh
```

Then, to update, rebuild and reinstall the `zsh`, you can do `zinit update zsh`. The binary can be safely copied over
`/bin/zsh` as it has paths to all needed directories built-in.

<!-- vim:set ft=markdown tw=80 fo+=an1 autoindent: -->
