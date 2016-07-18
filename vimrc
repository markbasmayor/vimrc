source ~/.vim/plugins.vim
source ~/.vim/plugin_settings.vim
source ~/.vim/helper.vim
source ~/.vim/aliases.vim

"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------

"turn off backwards compatibility
set nocompatible
set backspace=indent,eol,start
set encoding=utf8
set ffs=unix,dos,mac

" Set to auto read when a file is changed from the outside
set autoread

" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

autocmd filetype * let @/ = ""          " prevent previous search results from being highlighted

" use w!! to write protected files
cmap w!! %!sudo tee > /dev/null %

" remove trailing spaces on save
autocmd BufWrite * :call DeleteTrailingWS()

" Always show at least 3 lines above/below the cursor
set scrolloff=3

" Similarly, show at least 5 characters when scrolling horizontally
set sidescrolloff=5

" Show trailing spaces so it's easier to delete them
set listchars=tab:▸\ ,trail:·
set list

"------------------------------------------------------------------------------
" Resources
"------------------------------------------------------------------------------

" How many lines of history to remember.
set history=1000

" Use all the memory needed, for maximum performance.
set maxmemtot=2000000
set maxmem=2000000
set maxmempattern=2000000

"------------------------------------------------------------------------------
" VIM user interface
"------------------------------------------------------------------------------

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=.svn,CVS,.git
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg
set wildmode=longest,list,full

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"------------------------------------------------------------------------------
" Colors and Fonts
"------------------------------------------------------------------------------

set t_Co=256
set background=dark
colorscheme jellybeans

"------------------------------------------------------------------------------
" Text, tab and indent related
"------------------------------------------------------------------------------

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"------------------------------------------------------------------------------
" Files, backups and undo
"------------------------------------------------------------------------------

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"------------------------------------------------------------------------------
" Search
"------------------------------------------------------------------------------

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"------------------------------------------------------------------------------
" Synax highlighting
"------------------------------------------------------------------------------

syntax on
set number

" disable matching paren highlighting
let loaded_matchparen = 1

" Enable filetype plugins
filetype plugin on
filetype indent on

"------------------------------------------------------------------------------
" LANGUAGE specific
"------------------------------------------------------------------------------

" --- PHP

" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_sql_query=1

" does exactly that. highlights html inside of php strings
" autocmd FileType php let php_htmlInStrings=1

autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php map <F5> :w!<CR>:!clear<CR>:!/usr/bin/php %<CR>

" --- HTML
autocmd FileType html,xhtml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html set omnifunc=xmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

autocmd BufRead,BufNewFile *.md set filetype=markdown


