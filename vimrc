set nocompatible                " choose no compatibility with legacy vi

" For Vundle " {{{
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" " }}}

" Colorscheme {{{
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'tpope/vim-vividchalk'
" Silent prevents vim from complaining during initial setup when scheme is not
" available.
silent! colorscheme vividchalk
"color ir_black
"colorscheme Tomorrow-Night-Bright
set background=dark
"}}}

" For GUI {{{
if has("gui")
  set linespace=2
  set antialias
  set gcr=a:blinkon0

  " Don't beep or flash
  set noerrorbells visualbell t_vb=
  if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
  endif

  " Allow use of alt-h (gvim opens help menu
  set wak=no

  " Start without the toolbar
  set guioptions-=T
  " No scroll bar
  set guioptions-=L
endif
" }}}

" For MacVim {{{
if has("gui_macvim")
  set guifont=Menlo\ Regular:h12
  set macmeta
  set transparency=15
  map <D-t> :CommandT<CR>
  "macmenu &File.New\ Tab key=<nop>
endif
"}}}

" Vim Settings {{{
"set colorcolumn=80
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set undofile
set undodir=~/.vim/tmp
"set ttyfast

" Map ESC
imap jj <ESC>
let mapleader = ","               " The default leader key isn't very intuitive.

set number
set showmatch                   " matching brace/parenthesis/etc.
set hidden                      " http://nvie.com/posts/how-i-boosted-my-vim/

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

set list                          " Show hidden characters (tab and eol)
"set listchars=trail:⋅,nbsp:⋅,tab:▸\ ,eol:¬       " Use the same chars as textmate.
set listchars=trail:⋅,nbsp:⋅,tab:▸\        " Use the same chars as textmate.

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

"set ai           " always set autoindenting on

set backup       " keep a backup file
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set laststatus=2

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

nnoremap gp `[v`]

"nnoremap <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack 
nnoremap <leader>q gqip

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" vertical window split
noremap <leader>v <C-w>v

" horizontal window split
noremap <leader>s <C-w>s

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>h :set invlist<CR>
nmap <silent> <leader>l :set invnumber<CR>
nmap <silent> <leader>p :set invpaste<CR>

" Open last buffer: http://www.vimbits.com/bits/22
noremap <Leader><Leader> <C-^>

" Under/Over line current line
" http://www.vimbits.com/bits/12
nnoremap <leader>== yyPv$r=jyypv$r=
nnoremap <leader>** yyPv$r*jyypv$r*
nnoremap <leader>=  yypv$r=
nnoremap <leader>-  yypv$r-
"}}}

" Syntax Highlighting {{{
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd! BufNewFile,BufRead *.pp setlocal ft=puppet
"}}}

" Folding {{{
set foldmethod=marker
"Fold Tag
"http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>ft Vatzf
"}}}

" Fugitive {{{
Bundle 'tpope/vim-fugitive'

noremap ggs :Gstatus<cr>
noremap ggc :Gcommit<cr>
noremap gga :Gwrite<cr>
noremap ggl :Glog<cr>
noremap ggd :Gdiff<cr>
"}}}

" Command-T plugin {{{
"map <leader>f :CommandTFlush<CR>
"map <leader>t :CommandT<CR>
"}}}

" Ctrl-P plugin {{{
Bundle 'kien/ctrlp.vim'

map <leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'vendor/bundle'
" }}}

" NERD Tree {{{
Bundle 'scrooloose/nerdtree'

" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>n :NERDTreeToggle<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/tmp/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
" let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.swp$','\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '\.DS_Store$' ]

" Quit vim if nerdtree is last buffer
" https://github.com/scrooloose/nerdtree/issues/21
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"let g:NERDTreeWinPos = "right"
"}}}

" Powerline {{{
Bundle 'Lokaltog/vim-powerline'

"let g:Powerline_symbols = 'unicode'
"}}}

" Supertab and snipmate together {{{
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
" http://superuser.com/questions/172266/vim-how-to-work-with-both-supertab-vim-with-snipmate-vim
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"}}}

" YankRing {{{
Bundle 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = "$HOME/.vim/tmp/"
"}}}

" Git Gutter {{{
Bundle 'airblade/vim-gitgutter'

" Make git gutter background clear
highlight clear SignColumn
"}}}

" Undotree {{{
Bundle "mbbill/undotree"
nnoremap <leader>u :UndotreeToggle<cr>
" }}}

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails.git'
Bundle 'mileszs/ack.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-rbenv'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/peaksea'
Bundle 'scrooloose/nerdcommenter'
Bundle 'puppetlabs/puppet-syntax-vim'

filetype plugin indent on
