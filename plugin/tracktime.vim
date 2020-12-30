" Last Change: 2016-03-28  Monday: 07:09:51 PM
augroup TimeSpentEditing
    au!
    au BufWinEnter * if !exists('b:tstart')|let b:tstart=reltime()|en
augroup END

func! TimeSpentEditing()
   let secs=str2nr(reltimestr(reltime(b:tstart)))
   let hours=secs/3600
   let minutes=(secs-hours*3600)/60
   let seconds=secs-hours*3600-minutes*60
   return printf("%d:%02d:%02d",hours,minutes,seconds)
endfunc

com! TimeSpentEditing echo TimeSpentEditing()
map <silent> <leader>dt :TimeSpentEditing<CR>

:amenu Plugin.Time\ Spent\ on\ Editing\ (\Leader-dt\ or\ :TimeSpentEditing\) : TimeSpentEditing <CR><Esc><CR>

if g:osdetected == "Windows"
    :tmenu icon=$HOME/\.vim/bitmaps/clock.bmp 1.470 ToolBar.TimeSpentEditing Time Spent on Editing
    elseif g:osdetected != "Windows"
    :tmenu icon=$HOME/.vim/bitmaps/clock.bmp 1.470 ToolBar.TimeSpentEditing Time Spent on Editing
endif

:amenu ToolBar.TimeSpentEditing :TimeSpentEditing <CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

nmap <C-S-F3> a<C-R>= TimeSpentEditing() <Esc>
imap <C-S-F3> <C-R>= TimeSpentEditing() <Esc>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:amenu Insert.Insert\ Spent\ Time\ <\C\-S\-F3\> :put=TimeSpentEditing() <Esc>
