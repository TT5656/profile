set number
set mouse=a
set incsearch
set hlsearch
set cursorline
set wildmenu
set showcmd
set showmatch
set hidden
set tags=./tags;

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
let Tlist_WinWidth=40

" winmanager
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth=40

" NERDTree
let g:NERDTree_title='NERD Tree'
function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <silent> <F8> :WMToggle<CR>

" Close NERDTREE window if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Quit vim when no normal buffer exists anymore
"autocmd bufenter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/winmanager'
Plug 'vim-scripts/Conque-GDB'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()
