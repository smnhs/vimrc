# My vimrc file

After I got started with vim, I now copy-pasted my own vim config file.
I am pretty happy with it right now, but it is not finished.
Probably it will never be finished, because VIM is awesome and there is a lot more to discover.  
However, I would like to share my configurations with you.
If you are new to Vim and want to get started I recommend trying the vimtutor. It should be installed with Vim. Simply type `vimtutor` in your terminal.

## Setup
- Download the project.
- Rename the 'vimrc' file to '.vimrc' and put in in your home directory.
    Alternative: Put the file as 'vimrc' in the '~/.vim/' folder.
- Put the templates folder in the '~/.vim/' folder.
- Install and Setup [Vundle](https://github.com/VundleVim/Vundle.vim)

## Tipps & Tricks
In the following are some tipps & tricks I found useful:

### Entering Command Mode
Normally you need to tip ':' to enter the command mode.  
`nnoremap ; :`  
maps ';' to ':'.  
Now enter the command mode either with ':' or ';'.  
This saves pressing the shift key for my keyboard layout. But you can map it to whatever fits for you.  

### Line Numbers
Turn line numbers on:  
`set nu`  
Show relative linenumber to current line on:  
`set relativenumber`  
This is helpful for navigating or other position related actions.  

### Auto close brackets and quotes
This code inserts the second bracket or quote automatically after typing the first. But it still does not work as convenient as you may be used to.
```
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
```

*Did you wonder about the difference between 'inoremap' and 'nnoremap'?*  
The first letter stands for the mode you are in while mapping.  
i -> input, n -> normal, v -> visual,...  

## Status Line
Hand crafted status line **without plugins**. Much copy-paste in the process, but I am proud of how it turned out. Just paste the code in your vimrc file and try out if it fits for you!
```
" status line
" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={ 'n' : 'Normal ', 'no' : 'N·Operator Pending ', 'v' : 'Visual ', 'V' : 'V·Line ', '^V' : 'V·Block ', 's' : 'Select ', 'S': 'S·Line ', '^S' : 'S·Block ', 'i' : 'Insert ', 'R' : 'Replace ', 'Rv' : 'V·Replace ', 'c' : 'Command ', 'cv' : 'Vim Ex ', 'ce' : 'Ex ', 'r' : 'Prompt ', 'rm' : 'More ', 'r?' : 'Confirm ', '!' : 'Shell ', 't' : 'Terminal '}

" Function: return current mode
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
```

**Helpful resources:**  
https://kadekillary.work/post/statusline-vim/  
https://jdhao.github.io/2019/11/03/vim_custom_statusline/  

### Templates
I made a template for HTML files, which is loaded when creating a new .html file. The skeleton is found in the templates folder. It works the same for all filetypes:  
`au BufNewFile *.html 0r ~/.vim/templates/skeleton.html`  

### Plugins
For Plugins I use [Vundle](https://github.com/VundleVim/Vundle.vim). It is the only plugin manager I tried, but it works smooth and simple.  

My current installed Plugins:  
- [Nerdtree](https://github.com/preservim/nerdtree): Little file browser inside vim
- [Vim-Devicons](https://github.com/ryanoasis/vim-devicons): Adds pretty icons to filetypes
- [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe): Adds code completion
- [IndentPython](https://github.com/vim-scripts/indentpython.vim): Adds right indentation for python
- [Syntastic](https://github.com/vim-syntastic/syntastic): Adds syntax checking
- [vim-flake8](https://github.com/nvie/vim-flake8): Syntax and style checking
- [goyo](https://github.com/junegunn/goyo.vim): Distraction free mode
- [SimpylFold](https://github.com/tmhedberg/SimpylFold): Improved python folding


## Other helpful resources
- https://dougblack.io/words/a-good-vimrc.html
- https://stevelosh.com/blog/2010/09/coming-home-to-vim/  
- https://realpython.com/vim-and-python-a-match-made-in-heaven/
