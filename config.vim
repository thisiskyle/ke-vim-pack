source $VIMRUNTIME/defaults.vim



" plugins ---------------------------------------------------------
if has("win32") | call plug#begin('~/vimfiles/bundle')
elseif has("unix") | call plug#begin('~/.vim/bundle')
endif
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'
call plug#end()





" settings -------------------------------------------------------
if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=50 
    set columns=120
    set lazyredraw
    if has("win32") | set guifont=Courier\ Prime\ Code:h10
    elseif has("unix") | set guifont=Courier\ Prime\ Code\ 10
    endif
endif


set nobackup
set nowritebackup
set noswapfile
set noundofile

set incsearch 
set ignorecase
set nohlsearch
set smartcase

set tabstop=4
set autoindent
set shiftwidth=4
set expandtab
filetype plugin indent on

set belloff=all
set laststatus=0
set noshowcmd
set autochdir
set autoread

" vim wiki 
let wiki1 = {'path':'~\vimfiles\wiki\default', 'path_html':'~\vimfiles\wiki\default\html'}
let wiki2 = {'path':'~\wiki\work', 'path_html':'~\wiki\work\html'}
let g:vimwiki_list = [wiki1, wiki2]
" ctrlp
set tags+=./docs/tags;
let g:ctrlp_extensions = [ 'tag' ]
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25 

" mappings  -------------------------------------------------------
inoremap {<cr> {<cr>}<esc>O

nnoremap <c-b> :bp<cr>
nnoremap <c-n> :bn<cr>
nnoremap <c-k> :ToggleComment<cr>
nnoremap <m-k> ddkP
nnoremap <m-j> ddp
nnoremap <leader><leader> :OpenVimrc<cr>
nnoremap <leader>c :Ctags<cr>
nnoremap <leader>d :Doit<cr>
nnoremap <leader>e :Vex<cr>

" style  ----------------------------------------------------------
set rulerformat=%40(%m\ %{fugitive#head()}\ \ %l,%c%)
set guicursor+=n-v-c:blinkon0
let g:gruvbox_italic = '0'
let g:gruvbox_bold = '0'
let g:gruvbox_contrast_dark = 'soft'
colors simple 

" commands --------------------------------------------------------
command Ctags :call Ctags()
command Doit :call Doit()
command FormatJSON :call FormatJSON()
command OpenVimrc :call OpenVimrc()
command ToggleComment :call ToggleComment()

" functions -------------------------------------------------------
" Generate a tags file for current project
function! Ctags()
    if !isdirectory("./docs")
        call mkdir("./docs", "p")
    endif
    execute "!ctags -R -f ./docs/tags " . getcwd()
endfunction

" Generate a todo.txt file for this project
function! Doit()
    if !isdirectory("./docs")
        call mkdir("./docs", "p")
    endif
    !doit ./docs/todo.txt
endfunction

" Format a json file
function! FormatJSON()
    :%!python -m json.tool
endfunction


" Open the config.vim file the 
function! OpenVimrc()
    if has("unix") | :e ~/.vim/config.vim
    elseif has("win32") | :e ~/vimfiles/config.vim
    endif
endfunction

" Toggle comments for current line
function! ToggleComment()
    let save_pos = getpos(".")
    normal ^
    "vim file
    if (&ft=='vim')
        if getline('.')[col('.')-1] == "\""
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i"
            call setpos(".", save_pos)
            normal l
        endif
    "python
    elseif (&ft=='python')
        if getline('.')[col('.')-1] == "#"
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i#
            call setpos(".", save_pos)
            normal l
        endif
    "html & xml
    elseif (&ft=='xml' || &ft=='html' || &ft=='htm')
        if getline('.')[col('.')-1] == "<" && getline('.')[col('.')] == "!"
            normal 4x$2h3x
            call setpos(".", save_pos)
            normal 4h
        else
            normal i<!--
            normal $a-->
            call setpos(".", save_pos)
            normal 4l
        endif
    "c style
    else
        if getline('.')[col('.')-1] == "/"
            normal xx
            call setpos(".", save_pos)
            normal hh
        else
            normal i//
            call setpos(".", save_pos)
            normal ll
        endif
    endif
endfunction
