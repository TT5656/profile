set number

set mouse=a
set incsearch
set hlsearch
set cursorline
set wildmenu
set showcmd
set showmatch

set tags=./tags;
set csre

filetype plugin indent on

highlight BadWhitespace ctermbg=red guibg=darkred

autocmd filetype python,sh set ts=4 sw=4 et
autocmd BufNewFile,BufRead /work/bsp-build/*/aosp/* set tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead /work/bsp-build-ro/*/aosp/* set tabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

packadd! matchit
let b:match_words='\<ifndef\>\|\<ifdef\>\|\<ifeq\>\|\<ifneq\>:\<else\>:\<endif\>'

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

nnoremap <silent> <F8> :TlistToggle<CR>
