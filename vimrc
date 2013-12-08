set nocompatible                " choose no compatibility with legacy vi

let g:pathogen_disabled = []
call pathogen#infect()
call pathogen#helptags()

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set spelllang=en_us
set visualbell
set history=1000
set autoread
set showcmd

set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

silent !mkdir ~/.vim_runtime/undos > /dev/null 2>&1
set undodir=~/.vim_runtime/undos
set undofile

color molokai
let g:molokai_original = 1
set guioptions=Amg

set wildignore+=.git,vendor/**,install/**,*DS_Store*,*sass-cache*,log/**,tmp/**

let mapleader='<c>'
let g:mapleader='<c>'
let g:user_zen_expandabbr_key = '<c-Space>'
let g:use_zen_complete_tag = 1

set number
set autoindent
set linebreak
set scrolloff=8

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"Fast editing of the vimrc/gvimrc
map <leader>e :e! ~/.vimrc<cr>
map <leader>E :e! ~/.gvimrc<cr>

"When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"Ack
nnoremap <leader>a :Ack

"Move a line of text using Command+[jk]
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>

"Navigate between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Powerline
let g:Powerline_symbols='fancy'
set ls=2 " Always show status line

"I prefer CtrlP on top... #twss
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

"snipmate setup
"try
"  source ~/.vim/snippets/support_functions.vim
"catch
"  source ~/.dotfiles/vim/snippets/support_functions.vim
"endtry
"autocmd vimenter * call s:SetupSnippets()
"function! s:SetupSnippets()

    "if we're in a rails env then read in the rails snippets
"    if filereadable("./config/environment.rb")
"        call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
"        call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
"    endif
"
"    call ExtractSnips("~/.vim/snippets/html", "eruby")
"    call ExtractSnips("~/.vim/snippets/html", "xhtml")
"    call ExtractSnips("~/.vim/snippets/html", "php")
"endfunction

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
