set number
set relativenumber
syntax on
set autoindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set ruler
set rulerformat=%l,%v
set hls
set ignorecase

" Lightline 'Hack' to work with ZSH
set laststatus=2

" Colorscheme
colorscheme iceberg

" Disable audible bell sound
set noerrorbells visualbell t_vb=

set nocompatible              " be iMproved, required
filetype off                  " required

" Autoload Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Coc (Autocompletion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Lightline (Status Bar line for Vim)
Plug 'itchyny/lightline.vim'

" Fuzzy File Finder (FZF)
set rtp+=~/.fzf
Plug 'junegunn/fzf.vim'

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Fuzzy File Search
nnoremap <c-p> :Files<cr>

" Search all Occurences
nnoremap <c-f> :Ag<space>

" Initialize plugin system
call plug#end()

" 'Smart' nevigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
