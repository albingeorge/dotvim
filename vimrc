call pathogen#infect()
filetype off
syntax on
filetype plugin indent on


" Use pathogen to easily modify the runtime path to include all
" plugin under the ~/.vim/bundle directory
execute pathogen#infect()



" From http://nvie.com/posts/how-i-boosted-my-vim/
call pathogen#helptags()
" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


set nu
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set pastetoggle=<F10>
set incsearch
set smartcase
set copyindent
set hls


set rnu
colorscheme jellybeans
set laststatus=2
let g:airline#extensions#tabline#enabled = 1


function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"Remove trailing white space while saving
autocmd BufWritePre * :%s/\s\+$//e

set clipboard=unnamed
