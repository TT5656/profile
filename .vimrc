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

let NERDTreeIgnore=['\.o$','\.ko$','\.a$']

nnoremap <silent> <F2> :TlistToggle<CR>
nnoremap <silent> <F8> :WMToggle<CR>
nnoremap <silent> <Leader>m :MBEFocus<CR>
"nnoremap <silent> <F8> :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif<CR>

" Close NERDTREE window if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Quit vim when no normal buffer exists anymore
"autocmd bufenter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/winmanager'
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()
