" AwesomeNotes Plugin for Note-taking in Vim 
" Copyright (C) 2009 Kirtika B Ruchandani <kirtibr@gmail.com>  
" Personalised syntax for note-taking. 
" =============================================================
"  READ-ME -
" 1. [See Highlight groups KirtiStar and Normal ]
"    Normal mode- using bullet points for notes
"    begin a new line with an asterisk which will be highlighted 
"    in Magenta. No space before the asterisk is allowed. It must be
"    the first character on the line.
" 2. [See Higlight groups KirtiRedNotes and KirtiBlueNotes]
"    Highlighted note - Anything beginning with  the '->' sign is
"    written in blue and similarly, the '=>' is a crude bullet
"    for stuff to be written in red. These bullets may begin anywhere
"    in the line.   
" 3. [See Highlight group KirtiHeading]
"    If the first charater on the line is a proper character and not any 
"    of the above bullets or space, the whole line is taken as a section
"    heading and highlighted.
" 4. [See Highlight group KirtiLikes]   
"    Important keywords to draw attention



set wrap
syn case match
syn match KirtiStar /^*/ 
syn match KirtiDate /^\d\d\/\d\d\/\d\d/  
syn match KirtiHeading /^\C[A-Z]+\n/
syn region KirtiTitle start="^[A-Z]" end="\_$"
syn region KirtiBlueNotes start="->" end="\_$" contains=KirtiKeyword,KirtiLikes keepend
syn region KirtiRedNotes start="=>" end="\_$"  contains=KirtiKeyword,KirtiLikes keepend
syn match KirtiKeyword /[A-Z][A-Z][A-Z]\+/
syn keyword KirtiLikes  WOW[WWW] AWESOME IMP wow[www] awesome TODO FIXME CheckOut
syn match KirtiDelim	"^=\{3,}.*===$"
syn match KirtiAltDelim	"^-\{3,}.*--$"


hi Normal guifg=Black guibg=White 
hi KirtiStar guifg=DarkMagenta guibg=White 
hi KirtiTitle guifg=White guibg=DarkBlue
hi KirtiLikes guifg=DarkBlue guibg=cyan term=bold
hi KirtiKeyword guifg=DarkBlue term=bold
hi KirtiDate guifg=Purple
hi KirtiBlueNotes guifg=Blue
hi KirtiRedNotes guifg=Red
hi KirtiDelim guifg=DarkRed
hi KirtiAltDelim guifg=DarkGreen




let b:current_syntax="notes"


"Arbitrary nonsense
iab ins_hr __________________________________________________________________________________
iab inseqhr =================================================================================
iab instildehr ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
iab ins-hr ----------------------------------------------------------------------


