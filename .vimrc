"-----NeoBundle-----
" Required:
set runtimepath+=/Users/molmol178/dotfiles/.vim/bundle/neobundle.vim
call neobundle#begin(expand('$HOME/dotfiles/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'chriskempson/vim-tomorrow-theme'

NeoBundle 'scrooloose/nerdtree'

NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
let g:indent_guides_guide_size=1

NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode'
        \ }
    \ }

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Required:
call neobundle#end()
filetype plugin indent on

"------General Settings-----
set autoread
set nobackup
set noswapfile
set wildmode=list,full
set visualbell t_vb=
set laststatus=2

"-----Tab Settings-----
set tabstop=4
set autoindent
set shiftwidth=4
set smarttab
set expandtab

"-----Look Settings-----
set number
set list
set listchars=tab:__,trail:_,nbsp:%,eol:↲
set smartindent
set autoindent
set formatoptions-=c
set showmatch
set ruler
set hlsearch
autocmd ColorScheme * highlight LineNr ctermfg=30
autocmd ColorScheme * highlight Comment ctermfg=30
autocmd ColorScheme * highlight Visual ctermfg=0 ctermbg=4
autocmd ColorScheme * highlight Search ctermfg=0 ctermbg=85
autocmd ColorScheme * highlight ErrorMsg ctermfg=255 ctermbg=124

syntax on
colorscheme Tomorrow-Night-Bright
highlight Normal ctermbg=none

"-----Search Settings-----
set ignorecase
set smartcase
set wrapscan
set incsearch
