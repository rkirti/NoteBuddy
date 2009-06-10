" Vim filetype detection file
" Syntax:       Personal Notes Syntax
" Author:       Kirtika B Ruchandani <kirtibr@gmail.com> 
" Copyright:    Copyright (C) 2009 Kirtika B Ruchandani <kirtibr@gmail.com> 
" Licence:      You may redistribute this under the same terms as Vim itself
" This sets up the syntax highlighting for all notes [*.notes]

if &compatible || version < 600
    finish
endif

" Detect notes from this extension
au BufNewFile,BufRead *.notes	set filetype=notes
syn clear


