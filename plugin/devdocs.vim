" What command to use on what system
let s:cmds = {"DARWIN": "open", "LINUX": "xdg-open", "WINDOWS": "explorer"}

" Build the URL stub
let s:stub = s:cmds[devdocs#Get_env()] . " 'https://devdocs.io/?q="

" Build the command
command! -bang -nargs=* DD silent! call system(len(split(<q-args>, ' ')) == 0 ?
            \ s:stub . (expand('<bang>') == "!" || get(g:, 'devdocs_enable_scoping', 0) == 1 ? '' : &filetype) . ' ' . expand('<cword>') . "'" : len(split(<q-args>, ' ')) == 1 ?
            \ s:stub . (expand('<bang>') == "!" || get(g:, 'devdocs_enable_scoping', 0) == 1 ? '' : &filetype) . ' ' . <q-args> . "'" : s:stub . <q-args> . "'")
