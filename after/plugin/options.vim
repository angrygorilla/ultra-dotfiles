" Mostly stolen from Yan Pritzer's most excellent Yadr (github.com/skwp/dotfiles)

" Enable 256-color by default in the terminal
"if !has('gui_running') | set t_Co=256 | endif


" ================ General Config ====================

set number                      "Line numbers are good

" turn on syntax highlighting
syntax on

" Better search
set hlsearch
set incsearch
set history=1000                "Store lots of :cmdline history

set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom

set nowrap                      "Don't wrap lines
set linebreak                   "Wrap lines at convenient points

" Move normally between wrapped lines
nmap j gj
nmap k gk

autocmd BufReadPre,FileReadPre *.md :set wrap

set visualbell                  "No sounds
" set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" =========== Indentation ===========
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Wildignore
set wig+=vendor,log,logs

autocmd FocusLost * silent! wa " Automatically save file
set scrolloff=5 " Keep 5 lines below and above the cursor
set cursorline

" grep word under cursor
" nnoremap <Leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" Solarized theme
let g:solarized_termtrans = 1
set background=light
colorscheme solarized

if has("gui_running")
"tell the term has 256 colors
  set t_Co=256
end

"
" ALE
" https://medium.com/@victormours/better-linting-in-vim-with-ale-1e4b1d5789af
"
map <silent> <C-e> <Plug>(ale_next_wrap)

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_warnings = l:counts.total - l:all_errors

    let l:errors_recap = l:all_errors == 0 ? '' : printf('%d⨉ ', all_errors)
    let l:warnings_recap = l:all_warnings == 0 ? '' : printf('%d⚠ ', all_warnings)
    return (errors_recap . warnings_recap)
endfunction

set statusline+=%=
set statusline+=\ %{LinterStatus()}

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" mru
nnoremap <silent> <Leader>e :MRU<CR>

" NerdTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

" Open a NerdTree if no file is given as CLI argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if the only remaining window is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

autocmd BufReadPre,FileReadPre * :NERDTreeClose


" TComment
"
" Command-/ to toggle comments
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i

" Control-/ to toggle comments
map <C-/> :TComment<CR>
imap <C-/> <Esc>:TComment<CR>i

" Leader-/ to toggle comments
map <Leader>/ :TComment<CR>


" status line changes
function! GetBranchName(_) abort
  let b:branch_name = systemlist("git rev-parse --abbrev-ref HEAD 2> /dev/null || echo ''")[0]
endfunction
call timer_start(1000, function('GetBranchName'), {'repeat': -1})

autocmd BufEnter,BufWritePost * call GetBranchName("")

set laststatus=2
set statusline=%f " tail of the filename
set statusline+=\ c:%c " column number
set statusline+=%= " switching to right side
set statusline+=%(%{b:branch_name}%)

" Open splits on the right and below
set splitbelow
set splitright
