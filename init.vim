" https://github.com/angrygorilla/vim-from-scratch

set nocompatible
let g:mapleader=","

" Note that --sync flag is used to block the execution until the installer
" finishes.
"
" (If you're behind an HTTP proxy, you may need to add --insecure option to
" the curl command. In that case, you also need to set $GIT_SSL_NO_VERIFY to
" true.)

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/vendor')

if !has('nvim') && !exists('g:gui_oni') | Plug 'tpope/vim-sensible' | endif

" Cool Stuff
Plug 'rstacruz/vim-opinion'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'junegunn/vim-emoji' " https://github.com/junegunn/vim-emoji
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'yegappan/mru'

" Git
Plug 'tpope/vim-fugitive'

" Javascript
Plug 'othree/yajs'
Plug 'othree/javascript-libraries-syntax.vim'

" Formatting
Plug 'Vimjas/vim-python-pep8-indent'

" Syntax Highlighting
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'

" Visuals
Plug 'altercation/vim-colors-solarized'

" Commenting
Plug 'tomtom/tlib_vim'
Plug 'tomtom/tcomment_vim'

call plug#end()


