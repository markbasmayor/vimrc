source ~/.vim/plugins.vim
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

"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------

nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" Close vim if the only window left open is the NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeQuitOnOpen = 1

" Show current file in NERDTree
nmap <leader>s :NERDTreeToggle<CR>

"------------------------------------------------------------------------------
" NERDCommenter
"------------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"------------------------------------------------------------------------------
" Ragtag
"------------------------------------------------------------------------------

set timeout timeoutlen=5000
let g:ragtag_global_maps = 1

"------------------------------------------------------------------------------
" Snipmate
"------------------------------------------------------------------------------

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php,myphp'

"------------------------------------------------------------------------------
" Airline
"------------------------------------------------------------------------------
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline#extensions#whitespace#enabled = 1

let g:airline#extensions#tabline#enabled = 1

" show tab number
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline#extensions#branch#enabled = 0
let g:airline_powerline_fonts=1

"------------------------------------------------------------------------------
" Ack Grep / Silver Searcher
"------------------------------------------------------------------------------

" Silver searcher is a search utility that is supposed to be way faster
" compared to grep or vanilla ack.
" see https://github.com/ggreer/the_silver_searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column'
endif
nnoremap <leader>a :Ack!<space>

"------------------------------------------------------------------------------
" CtrlP
"------------------------------------------------------------------------------

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_map                     = '<c-p>'
let g:ctrlp_regexp                  = 1
let g:ctrlp_match_window_bottom     = 1
let g:ctrlp_open_new_file           = 't'
let g:ctrlp_open_multiple_files     = 'tjr'
let g:ctrlp_lazy_update             = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

if executable('ag')
  let g:ctrlp_user_command = 'ag %s --ignore-case --nocolor --nogroup -g ""'
endif

" keep in case silver searcher is slow or not installed
" if system('git rev-parse --is-inside-work-tree') =~ 'true'
  " let g:ctrlp_user_command = 'cd %s && git ls-files'
" endif

"------------------------------------------------------------------------------
" Multi cursor
"------------------------------------------------------------------------------
let g:multi_cursor_use_default_mapping=1

"------------------------------------------------------------------------------
" Indent Guides
"------------------------------------------------------------------------------

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']


