function! devdocs#Get_env() abort
    if has('win64') || has('win32') || has('win16')
        return 'WINDOWS'
    else
        let l:uname = toupper(substitute(system('uname'), '\n', '', ''))

        return l:uname =~ '\(MINGW\|CYGWIN\)' ? 'WINDOWS' : l:uname
    endif
endfunction
