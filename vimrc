set nocompatible                " choose no compatibility with legacy vi
filetype off
set modelines=0

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  "Core
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'bling/vim-airline'
  Plugin 'scrooloose/syntastic'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'tpope/vim-fugitive'
  Plugin 'mileszs/ack.vim'
  Plugin 'vim-scripts/YankRing.vim'
  Plugin 'jlanzarotta/bufexplorer'

  "Language-specific
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-haml'
  Plugin 'othree/html5.vim'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-cucumber'
  Plugin 'dagwieers/asciidoc-vim'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  "Plugin 'slashmili/alchemist.vim'
  "Plugin 'fatih/vim-go'

  "Additional
  Plugin 'vim-scripts/Rainbow-Parenthesis'
  Plugin 'ervandew/supertab'
  Plugin 'scrooloose/snippets'
  Plugin 'tpope/vim-endwise'
  Plugin 'vim-scripts/sessionman.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'tpope/vim-surround'
  Plugin 'ryanoasis/vim-devicons'

  " Testing
  Plugin 'airblade/vim-gitgutter'
  Plugin 'mattn/emmet-vim'
  Plugin 'sheerun/vim-polyglot'
  " Plugin 'easymotion/vim-easymotion'
  
  " Themes
  Plugin 'joshdick/onedark.vim'
  Plugin 'vim-airline/vim-airline-themes'
call vundle#end()  

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set spelllang=en_us
set visualbell
set history=1000
set autoread
set showcmd
set cursorline
set ttyfast
set ruler
set wildmenu
set wildmode=list:longest

set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
" set backspace=indent,eol,start  " backspace through everything in insert mode
set pastetoggle=<F11>

let mapleader=','
let g:mapleader=','

"" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

silent !mkdir -p ~/\.vim_runtime/undos > /dev/null 2>&1
set undodir=~/.vim_runtime/undos
set undofile

" Configure UI
set term=screen-256color
"let base16colorspace=256        " Access colors present in 256 colorspace
set t_Co=256
set background=dark

"colorscheme Tomorrow-Night-Eighties
let g:onedark_termcolors=256
colorscheme onedark

set guioptions=Amg
set nofoldenable                " disable code folding

set wildignore+=.git,vendor/**,install/**,*DS_Store*,*sass-cache*,log/**,tmp/**

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

"When vimrc is edited, reload it
"autocmd BufWritePost .vimrc source %

"Netwr
let g:netrw_liststyle = 3

"Key Mappings
nnoremap <leader>a :Ack<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>d :NERDTreeToggle<CR>

map <leader>e :e! ~/.vimrc<cr>
map <leader>E :e! ~/.gvimrc<cr>

"Navigate between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Strip all trailing whitespace from current document
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Select text just pasted for further formatting
nnoremap <leader>v V`]

"Airline/Powerline
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:Powerline_symbols='fancy'
set laststatus=2 " Always show status line

"Yankring
let g:yankring_history_file = '.vim_runtime/yankring_history'

"CtrlP Options
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = '<leader>,'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

"I prefer CtrlP on top... #twss
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1

let g:sparkupExecuteMapping='<C-e>'

"Save on lost focus
au FocusLost * :wa

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"Cool macro to add = dividers
nnoremap <leader>1 yypVr=
