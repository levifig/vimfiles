set guifont=Menlo\ Regular:h14
set antialias
set lines=60 columns=170

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

if has("gui_macvim")
" Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  macm File.New\ Tab key=<nop>
  nmap <D-t> :sp .<CR>
  macm File.Open\ Tab\.\.\. key=<nop>
  nmap <D-T> :vs .<CR>
end
