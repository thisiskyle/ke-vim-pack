source $VIMRUNTIME/defaults.vim

" plugins ----------------------------------------------------------------
if has("win32") | call plug#begin('~/vimfiles/bundle')
elseif has("unix") | call plug#begin('~/.vim/bundle')
endif
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
"Plug 'sheerun/vim-polyglot'
call plug#end()

" settings ---------------------------------------------------------------
if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=55 
    set columns=105
    if has("win32") | set guifont=Courier\ Prime\ Code:h10
    elseif has("unix") | set guifont=Courier\ Prime\ Code\ 10
    endif
endif
set bg=dark
set lazyredraw
set incsearch
set nohlsearch
set nobackup
set nowritebackup
set noswapfile
set noundofile
set tabstop=4
set autoindent
set shiftwidth=4
set expandtab
set belloff=all
set laststatus=0
set noshowcmd
set autochdir
set autoread
set ignorecase
set smartcase
if exists('+fixeol') | set nofixeol | endif

filetype on
filetype plugin on
filetype indent on

" mappings  ---------------------------------------------------------------
inoremap {<CR> {<CR>}<ESC>O

nnoremap <C-n> :bn<CR>
nnoremap <C-m> :bp<CR>
nnoremap <C-i> :ToggleComment<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>0 :OpenVimrc<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>2 :set ruler!<CR>


" vim wiki  ---------------------------------------------------------------
let wiki1 = {'path':'~\vimfiles\wiki\default', 'path_html':'~\vimfiles\wiki\default\html'}
let wiki2 = {'path':'~\wiki\work', 'path_html':'~\wiki\work\html'}
let g:vimwiki_list = [wiki1, wiki2]

" color/style  ------------------------------------------------------------
set rulerformat=%40(%m\ %{fugitive#head()}\ \ %l,%c%)
set guicursor+=n-v-c:blinkon0

let g:gruvbox_italic = '0'
let g:gruvbox_bold = '0'
let g:gruvbox_contrast_dark = 'soft'

colors simple 

" custom commands ---------------------------------------------------------
command FormatJSON :call FormatJSON()
command OpenVimrc :call OpenVimrc()
command ToggleSyntaxHL :call ToggleSyntaxHL()
command ToggleComment :call ToggleComment()


function! FormatJSON()
    :%!python -m json.tool
endfunction


function! OpenVimrc()
    if has("unix") | :e ~/.vim/config.vim
    elseif has("win32") | :e ~/vimfiles/config.vim
    endif
endfunction


function! ToggleSyntaxHL()
    if exists("g:syntax_on") | syntax off
    else | syntax enable
    endif 
endfunction


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
    elseif (&ft=='py')
        if getline('.')[col('.')-1] == "#"
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i#
            call setpos(".", save_pos)
            normal l
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
