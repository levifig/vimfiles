set guifont=Liberation\ Mono\ Powerline:h18
set antialias
set lines=60 columns=170

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

if has("gui_macvim")
" Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Let's unset CMD-t, CMD-T, CMD-S and CMD-W
  macm File.New\ Tab key=<nop>
  macm File.Open\ Tab\.\.\. key=<nop>
  "macm File.Save\ As\.\.\. key=<nop>
  "macm File.Close\ Window key=<nop>

  "Splits 
  nmap <D-t> :sp .<CR>
  nmap <D-T> :vs .<CR>

  "Move a line of text using Command+[jk]
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
end
