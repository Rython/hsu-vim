set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'                  " Vundle 必选
Plugin 'jiangmiao/auto-pairs'               " 括号补全
Plugin 'Valloric/ListToggle'                " 文件列表
Plugin 'asins/vimcdoc'                      " 中文文档
Plugin 'luochen1990/rainbow'                " 彩虹括号
Plugin 'artur-shaik/vim-javacomplete2'      " Java 补全
Plugin 'taglist.vim'                        " Tag 列表
Plugin 'bling/vim-airline'                  " 类似Powerline
Plugin 'Yggdroot/indentLine'                " 缩进线
Plugin 'The-NERD-tree'
Plugin 'minibufexplorerpp'                  " 可视化标签
Plugin 'Visual-Mark'                        " 可视化书签
Plugin 'altercation/vim-colors-solarized'   " Solarized 配色
Plugin 'tomasr/molokai'                     " Sublime 配色
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/VimIM'                  " Vim 输入法
Plugin 'humiaozuzu/fcitx-status'            " 记录 Fcitx 输入状态
Plugin 'drmingdrmer/xptemplate'             " 代码片断快速插入
"Plugin 'Valloric/YouCompleteMe'            " Ycm 使用源中已编译版
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put non-Plugin stuff after this line
"************************** VIMRC Example ***********************************"
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Feb 05
"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file (restore to previous version)
    set undofile		" keep an undo file (undo changes after closing)
endif
set history=100		" keep 100 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else
    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

"*************************** My Configuration *****************************"
" Author: Wang Hsutung
" Update: 2015/07/24
" Locale: Hubei Wuhan
" Email: hsu[AT]whu.edu.cn

colorscheme elflord
set dictionary+=/usr/share/dict/words
set number           " 显示行号
set nobackup         " 不备份文件
set noundofile       " 不产生撤销文件
set wrapscan         " 搜索返回首部
set whichwrap+=h,l   " 允许使光标跨行的键
set expandtab        " 把 Tab 替换为空格
set cinoptions=:0,g0 " case 和类属性标号不缩进
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set list
" Set default encoding(s)
set fileencoding=utf-8
set fileencodings=utf-8,prc,taiwan,japan
" 简化补全快捷键
inoremap <C-k> <C-x><C-k>
inoremap <C-l> <C-x><C-l>
" 简化切换窗口
map <C-Up> <C-w><Up>
map <C-Down> <C-w><Down>
map <C-Left> <C-w><Left>
map <C-Right> <C-w><Right>
" 以下 Tab 设置由官方文档推荐
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Syntax on 会用缺省值覆盖自己的色彩设置, enable 不会。
syntax enable
set cindent		" 优先级高于 smartindent
set smartindent
" 把系统粘贴版和默认粘贴版关联
if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

" 切换文件目录
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

set cursorline                  " Highlight current line
hi CursorLine  cterm=NONE   ctermbg=DarkGray
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
"set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap too

if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

nnoremap Y y$
nmap <silent> <leader>/ :nohlsearch<CR>

cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

cmap w!! w !sudo tee % >/dev/null

source ~/.vim/myconf/sourceCodeMode.vim  " 执行我的脚本

"****************** 插件相关设置 *******************
autocmd filetype c let g:ycm_global_ycm_extra_conf = '/home/wang/.vim/myconf/ycm_extra_conf_c.py'
autocmd filetype cpp let g:ycm_global_ycm_extra_conf = '/home/wang/.vim/myconf/ycm_extra_conf_cpp.py'
let g:ycm_key_invoke_completion = '<F3>'

let Tlist_Use_Split_Window = 1
command! WM NERDTreeToggle | TlistToggle
map wmr :WM<CR>

autocmd WinEnter * call s:CloseIfOnlyControlLeft()
" 在进入新窗口时，如果没有编辑区了，退出 Vim
function! s:CloseIfOnlyControlLeft()
    if exists("t:NERDTreeBufName") && exists("g:TagList_title")
        if bufwinnr(t:NERDTreeBufName) != -1 && bufwinnr(g:TagList_title) != -1
            if winnr("$") == 2
                q
            endif
        endif
        " 接下来的两个 if 一定要在后面
    endif
    if exists("t:NERDTreeBufName") && winnr("$") == 1
        if bufwinnr(t:NERDTreeBufName) != -1
            q
        endif
    endif
    if exists("g:TagList_title") && winnr("$") == 1
        if bufwinnr(g:TagList_title) != -1
            q
        endif
    endif
endfunction

" Vim Indent Line
let g:indentLine_color_term = 239
" GVim
let g:indentLine_color_gui = '#A4E57E'
" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)


let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    "    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Java 补全
autocmd FileType java set omnifunc=javacomplete#Complete
nnoremap <F4> call javacomplete#AddImport()<cr>

" Rainbow
let g:rainbow_active = 1

"Vimim
let g:Vimim_shuangpin = 'ms'
let g:vimim_cloud = 'sogou,baidu,qq'

" XP Template
let g:xptemplate_vars = "SParg="

