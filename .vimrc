set tabstop=4
set softtabstop=4
set expandtab
set number

set mouse=a
set incsearch
set hlsearch
set cursorline
set wildmenu
set showcmd
set showmatch

set tags=./tags;

filetype indent on

colorscheme peachpuff

packadd! matchit
let b:match_words='\<ifndef\>\|\<ifdef\>\|\<ifeq\>\|\<ifneq\>:\<else\>:\<endif\>'

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

nnoremap <silent> <F8> :TlistToggle<CR>
