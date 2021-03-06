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
set nrformats=

set rnu
colorscheme badwolf
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_max_files=0
let g:multi_cursor_exit_from_insert_mode = 0



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


function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

:nnoremap <F5> :buffers<CR>:buffer<Space>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 50, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 50, 4)<CR>

