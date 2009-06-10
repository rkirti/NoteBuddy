" Vim plugin file
" Purpose:	Create a template for new .notes files
" Author:	Kirtika B Ruchandani <kirtibr@gmail.com> 
" Copyright:	Copyright (C) 2009 Kirtika B Ruchandani <kirtibr@gmail.com> 
" Will try to use git to find the user name and email

if &compatible || v:version < 600
    finish
endif

fun! <SID>GetUserName()
    let l:user_name = system("git config --get user.name")
    if v:shell_error
        return "Unknown User"
    else
        return substitute(l:user_name, "\n", "", "")
endfun

fun! <SID>GetUserEmail()
    let l:user_email = system("git config --get user.email")
    if v:shell_error
        return "unknown@user.org"
    else
        return substitute(l:user_email,"\n","", "")
endfun

fun! NotesHeader()
    let l:current_year = strftime("%Y")
    let l:user_name = <SID>GetUserName()
    let l:user_email = <SID>GetUserEmail()
    0 put ='# Copyright (C) ' . l:current_year .
                \ ' ' . l:user_name . ' <' . l:user_email . '>'
    put ='# Released under the Creative Commons License'
    $
endfun

fun! NewNotesTemplate()
    let l:paste = &paste
    set nopaste
    
    " Get the header
    call NotesHeader()

    " New the bb template
    put ='# Lecture-Topic = \"\"'
    put ='# Suggested References = \"\"'
       " Go to the first place to edit
    0
    /^# Lecture-Topic =/
    exec "normal 2f\""

    if paste == 1
        set paste
    endif
endfun

if !exists("g:notes_create_on_empty")
    let g:notes_create_on_empty = 1
endif

" disable in case of vimdiff
if v:progname =~ "vimdiff"
    let g:notes_create_on_empty = 0
endif

augroup NewNotes
    au BufNewFile *.notes
                \ if g:notes_create_on_empty |
                \    call NewNotesTemplate() |
                \ endif
augroup END

