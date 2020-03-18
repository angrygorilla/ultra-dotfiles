
" ctrl-s to save
noremap <C-s> :w<CR>

" ctrl-p to open a file via fzf
if exists(':FZF')
  nnoremap <C-p> :FZF!<cr>
endif

" SPC-f-e-d to edit your config file
nnoremap <leader>fed :cd ~/.vim<CR>:e ~/.vim/init.vim<CR>
" SPC-f-e-k to edit your kepmap file
nnoremap <leader>fek :cd ~/.vim<CR>:e ~/.vim/after/plugin/key_bindings.vim<CR>
" SPC-f-e-o to edit your options file
nnoremap <leader>feo :cd ~/.vim<CR>:e ~/.vim/after/plugin/options.vim<CR>

" https://dmerej.info/blog/post/lets-have-a-pint-of-vim-ale/
" bindings for ale errors
nnoremap <space>l :lnext<CR>
nnoremap <space>p :lprevious<CR>
nnoremap <space>r :lrewind<CR>

" https://medium.com/@victormours/better-linting-in-vim-with-ale-1e4b1d5789af
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" Flip colorscheme
nmap <Leader>dt :set background=dark<cr>
nmap <Leader>lt :set background=light<cr>

" Quick jumping between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Open new splits easily
map vv <C-W>v
map ss <C-W>s
map Q  <C-W>q

" Press Ctrl-Tab to switch between open tabs (like browser tabs) to
 " the right side. Ctrl-Shift-Tab goes the other way.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

" MRU
nnoremap <silent> <Leader>e :MRU<CR>
