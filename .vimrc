" VIM Configuration File
" Author: yuleilai

set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on


"set gvim fullscreen
au GUIEnter * simalt ~x

"set gui font to lucida console
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
if has("gui_running")
	set guifont=Lucida\ console:h12
endif

"set the menu and the message to english
set langmenu=en_US
let $LANG='en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set nocompatible                " Use Vim defaults (much better!)
set nobackup                    " set no backup
set bs=indent,eol,start         " allow backspacing over everything in insert mode
set viminfo='20,\"50            " read/write a .viminfo file, don't store more
                                " than 50 lines of registers
set history=50                  " keep 50 lines of command line history
set cmdheight=1                 " Set command-line height
set cindent shiftwidth=4        " Vim knows a lot about C programs and will try very hard to automatically set the indent for you
set expandtab
set tabstop=4
set softtabstop=4               " This will make the <Tab> key insert 4 spaces worth of indent 
set ruler                       " show the cursor position all the time
set nu                          " show the line number all the time
set showcmd                     " Display an incomplete command in the lower right corner of the Vim window
set incsearch                   " Display the match for a search pattern when halfway typing it
set wildmenu                    " Command-line completion operates in an enhanced mode
set equalprg=indent             " set the external program Vim should use for indentation when using the commands with =
set ignorecase smartcase	    " Ignor case while searching when no upcase
set tags=tags;

"[F1] Toggle Menu
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=b
set showtabline=0
map <silent> <F1> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
   \endif<CR>

"[F2] delete spaces at the end of lines
map <F2> :%s/\s*$//g<cr>:nohlsearch<cr>

map <C-j> <C-W>j 
map <C-k> <C-W>k 
map <C-h> <C-W>h 
map <C-l> <C-W>l 

map <silent> <C-n> :nohlsearch<cr>

"nerdTree plugin config {{{
" autocmd vimenter * NERDTree
nmap <silent> <leader>n :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
" bufkill bd's: really do not mess with NERDTree buffer
nnoremap <silent> <backspace> :BD<cr>
nnoremap <silent> <s-backspace> :BD!<cr>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>
"}}}


"config tagbar plugin {{{
let Tlist_Use_Right_Window = 1
"}}}

"set colorscheme {{{
syntax enable
if has('gui_running')
    set background=dark
else
    set background=dark
endif
colorscheme solarized
"}}}


"config syntastic {{{
let g:syntastic_check_on_open=1
"}}}
