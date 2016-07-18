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


