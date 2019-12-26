# vim-devdocs

Look up keywords on [https://devdocs.io](https://devdocs.io) from Vim.

## Introduction

Vim-devdocs is a very small and trivial plugin with a laser-focused purpose: making it possible to look up keywords on [https://devdocs.io](https://devdocs.io) from Vim.

It does so by providing a single command, `:DD`, that will figure out the current filetype and point your default browser to the web app with the correct query.

Even better, `:DD` can be used under the hood by the built-in `K` for maximum street credibility.

To work its magic, vim-devdocs depends on:

* `xdg-open` on Linux and BSD, part of the `xdg-utils` package,
* `open` on MacOS, it's installed by default,
* `cmd.exe` on Windows, it's also installed by default,

but you can tell it to use any external command with `'g:devdocs_open_command'`.

Vim-devdocs started its life in my config as an experimental snippet circa 2016, then became a clean and reusable Gist in mid-2017, which I decided to weaponize one year later. If you think a plugin should not be needed for such a trivial feature be reassured that I totally share that view. If you feel remix-y, [the original (but regularly updated) Gist](https://gist.github.com/romainl/8d3b73428b4366f75a19be2dad2f0987) is still up in all its 13LOC glory.

NOTE: vim-devdocs is not affiliated in any way with [https://devdocs.io](https://devdocs.io) so any request pertaining to that site should be directed to its operators.

## Installation

Use your favorite plugin manager or dump the files below in their standard location:

on Unix-like systems…

    ~/.vim/doc/devdocs.txt
    ~/.vim/plugin/devdocs.vim

on Windows…

    %userprofile%\vimfiles\doc\devdocs.txt
    %userprofile%\vimfiles\plugin\devdocs.vim

If you go with the manual method, don't forget to execute the following command to make the documentation globally available:

on Unix-like systems…

    :helptags ~/.vim/doc

on Windows…

    :helptags %userprofile%\vimfiles\doc

## Configuration

Add the line below to your vimrc if you want to disable automatic filetype scoping:

    let g:devdocs_enable_scoping = 0

## Usage

Use `:DD` without argument to look up the word under the cursor, scoped with the current filetype:

    :DD

Use `:DD [keyword]` to look up the given keyword, scoped with the current filetype:

    :DD Map

Use `:DD [filetype] [keyword]` to do the scoping yourself:

    :DD scss @mixin

Add a `<bang>` to prevent automatic filetype scoping:

    :DD!
    :DD! Map

unless you absolutely insist:

    :DD! scss @mixin

Vim comes with the built-in and often overlooked `K`, a normal mode command that looks up the keyword under the cursor with the external command or Ex command set via the `'keywordprg'` option. `:DD` being a pretty basic Ex command it is easy to use it for `K`.

If you want `K` to ALWAYS use `:DD`, put this line in your vimrc:

    set keywordprg=:DD

If you want `K` to use `:DD` ONLY for certain filetypes, put this line in the appropriate `after/ftplugin/<filetype>.vim`:

    setlocal keywordprg=:DD
