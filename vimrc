set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)


Plugin 'preservim/nerdtree'

Plugin 'ryanoasis/vim-devicons'

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'vim-scripts/indentpython.vim'

Plugin 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntax
Plugin 'vim-syntastic/syntastic'
" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1

" PEP-8
Plugin 'nvie/vim-flake8'

" distraction free mode
Plugin 'junegunn/goyo.vim'
nnoremap <C-g> :Goyo<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let mapleader = "/"

set encoding=utf-8
" Nerd Font for DevIcons
" set guifont=UbuntuMono\ Nerd\ Font\ Mono\ Reguar\ 13
set autoread
set clipboard=unnamed
set modelines=0
set ttyfast
" set undofile " save undo information in files. After reopening it is not lost 

set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set scrolloff=3
set linebreak
set nu
set relativenumber " shows relative linenumber to current line on


set splitbelow
set splitright
set noshowmode

" save shift key for entering command mode
nnoremap ; :

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za


" auto close brackets and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O


" Start NERDTree. If a file is specified, move the cursor to its window.
au StdinReadPre * let s:std_in=1
au VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree and put the cursor back in the other window.
""autocmd VimEnter * NERDTree | wincmd p

" settings for filetypes
au BufNewFile,BufRead *.py
    \ set expandtab |
    \ set tabstop=4 |
    \ set softtabstop=4 | " Indentation
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set formatoptions=qrn1 |
    \ set colorcolumn=85 |
    \ set autoindent |
    \ set fileformat=unix |
    
au BufNewFile,BufRead *.js, *.html, *.css
    \ set expandtab |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

au BufNewFile,BufRead *.md
    \ set filetype=markdown | " treat all .md files as markdown
    \ set cursorline | " Highlight the line the cursor is on
    \ set conceallevel=2 | " Hide and format markdowm elements

" templates for new files
augroup templates
    au BufNewFile *.html 0r ~/.vim/templates/skeleton.html
augroup END

au FocusLost * :wa

let python_highlight_all=1
syntax on

" regex search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
" clear out a search
nnoremap <cr> :noh<cr> 


" status line
" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={ 'n' : 'Normal ', 'no' : 'N·Operator Pending ', 'v' : 'Visual ', 'V' : 'V·Line ', '^V' : 'V·Block ', 's' : 'Select ', 'S': 'S·Line ', '^S' : 'S·Block ', 'i' : 'Insert ', 'R' : 'Replace ', 'Rv' : 'V·Replace ', 'c' : 'Command ', 'cv' : 'Vim Ex ', 'ce' : 'Ex ', 'r' : 'Prompt ', 'rm' : 'More ', 'r?' : 'Confirm ', '!' : 'Shell ', 't' : 'Terminal '}

" Function: return current mode
" thanks to https://kadekillary.work/post/statusline-vim/
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction


set laststatus=2
set statusline=
set statusline+=%#function#\ %p%% " show line number
set statusline+=\ %*
set statusline+=≼
set statusline+=\ %t
set statusline+=≽\ %*
set statusline+=%m
set statusline+=
set statusline+=%#keyword#\ %F  " show full file path
set statusline+=%=≼

set statusline+=\ %{ModeCurrent()}

set statusline+=

let g:syntastic_stl_format = "[%E{Err: l.%F #%t}]"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
