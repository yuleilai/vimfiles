"==================================================
" File:         .vimrc
" Author:       yuleilai
" Description:  vim configuration file
"==================================================

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on


" set gvim fullscreen {{{
if has("gui_running") && (has("win32") || has("win64"))
    au GUIEnter * simalt ~x
endif
"}}}
set t_Co=256 
set encoding=utf-8
let g:Powerline_symbols='fancy'

"set gui font to lucida console
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
if has("gui_running")
    if has("win32") || has("win64")
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
    else
        set guifont=Monaco\ 10
        set guifontwide=Yahei\ Consolas\ Hybrid\ 10
    endif
endif

"set the menu and the message to english
"set langmenu=en_US
"let $LANG='en_US'
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

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
set laststatus=2                " Always show statusline
set cursorline
set tags=tags;

"[F1] Toggle Menu
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=b
"set showtabline=0
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

" nerdTree plugin config {{{
let NERDChristmasTree=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['doc$[[dir]]','.d$[[file]]','.o$[[file]]','.taghl$[[file]]','tags$[[file]]']

nmap <silent> <leader>t :NERDTreeToggle <CR>
"}}}


"config tagbar plugin {{{
let Tlist_Use_Right_Window = 1
"}}}

"set colorscheme {{{
syntax enable
if has('gui_running')
    set background=dark
else
    set background=light
endif
colorscheme molokai
"}}}


"config syntastic {{{
let g:syntastic_check_on_open=1
"}}}

" ctrlp {{{
nmap <leader>p :CtrlP <cr>
let g:ctrlp_open_multiple_files = 'v'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.exe
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|svn|doc)$',
            \ 'file': '\v\.(log|jpg|png|jpeg|bmp)$',
            \ }
set wildignore+=*.o,*.d
" }}}

" Jump to the last position{{{
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
" }}}

