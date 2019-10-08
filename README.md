# Zplugin Console

A consolette for Zplugin – based on the `zsh/zcurses` Zshell module and the
[ZUI](https://github.com/zdharma/zui) library – it allows the user to:

- view the currently loaded plugins in a colorful list, in one of 3 different
  display modes,
- unload and load plugins,
- delete the plugins and snippets from the disk.

## Screencast

[![asciicast](https://asciinema.org/a/272994.svg)](https://asciinema.org/a/272994)

## Installation

Load like any other normal plugin, e.g.:, with use of the Turbo mode:

```zsh
zplugin ice wait lucid
zplugin load zplugin/zplugin-console
```

<!-- vim:set ft=markdown tw=80 fo+=an1 autoindent: -->
