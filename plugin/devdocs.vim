" What command to use
function! s:Cmd() abort
    " Linux
    if executable("xdg-open")
        return "xdg-open"
    endif
    " Mac OS X
    if executable("open")
        return "open"
    endif
    " Windows
    return "explorer"
endfunction

" Build the URL stub
let s:stub = get(g:, "devdocs_open_command", <SID>Cmd()) . " 'https://devdocs.io/?q="

" Build the command
command! -bang -nargs=* DD silent! call system(len(split(<q-args>, ' ')) == 0 ?
            \ s:stub . (expand('<bang>') == "!" || get(g:, 'devdocs_enable_scoping', 0) == 1 ? '' : &filetype) . ' ' . expand('<cword>') . "'" : len(split(<q-args>, ' ')) == 1 ?
            \ s:stub . (expand('<bang>') == "!" || get(g:, 'devdocs_enable_scoping', 0) == 1 ? '' : &filetype) . ' ' . <q-args> . "'" : s:stub . <q-args> . "'")
