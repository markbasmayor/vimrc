set nocompatible              " be iMproved, required
filetype off       

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add plugins here...
" Launch vim and run :BundleInstall , everything will be ready for you
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-ragtag'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'Valloric/MatchTagAlways'
" Plugin 'ervandew/supertab'

" snippets bundle
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required
