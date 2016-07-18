"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ;
let mapleader=","
let g:mapleader=","

nnoremap ; :

" quick alias to leave vim
nmap <leader>w :w<CR>
nmap <leader>q :q!<CR>
nmap <leader>wq :wq<CR>

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" ;/ turn off search highlighting
nmap <leader>/ :set hls!<CR>
nnoremap <silent><leader>s :nohlsearch<CR>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Remap VIM 0 to first non-blank character
map 0 ^

nmap <leader>c :noh<CR>

nnoremap <silent> <F4> :set number!<CR>
nnoremap <silent><F6> :set paste!<BAR>set paste?<CR>

map <leader>t :tabnew<CR>

nnoremap <leader>a :Ack!<space>
inoremap jj <ESC>


