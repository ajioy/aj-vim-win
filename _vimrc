"==========================================
" Author:  Ajioy
" Version: 1.0
" Email: ajioy@hotmail.com
" BlogPost: http://blog.csdn.net/ajioy
" Last_modify: 2019-7-28
"==========================================

" +--------------------------------------------------------------------------+
" +---------------------------------custom setting---------------------------+
" +--------------------------------------------------------------------------+
"==========================================
" General Settings 基础设置
"==========================================
" 修改<leader>键
" let mapleader=","
let g:mapleader = ','

" 语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

"set mouse=a
set mouse-=a " disable mouse

" history存储容量
set history=2000
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on
" 文件修改之后自动载入
set autoread

" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set vb t_vb=
set tm=500
au GuiEnter * set t_vb=

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" backup setting, when crash can recovery
set backupdir=~/.vimbackup//
" set directory=~/.vimswp//
set undodir=~/.vimundo//
set noswapfile
" set nobackup
" set noundofile
" set nowritebackup

" set vim keyboard mode, not vi mode
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" vim-multiple-cursors, fix ctrl n not work
set selection=inclusive

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================
" show rows
set nu
" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令

set showcmd
" 取消换行

set nowrap
" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
"set nofoldenable

" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
" set foldmethod=manual
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

set backspace=2
set textwidth=79
" alert over80
hi Over80 guifg=fg guibg=Blue 
au BufNewFile,BufRead *.* match Over80 '\%>80v.*'

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" " 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
" set relativenumber number
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" " 插入模式下用绝对行号, 普通模式下用相对
" autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber
" function! NumberToggle()
  " if(&relativenumber == 1)
    " set norelativenumber number
  " else
    " set relativenumber
  " endif
" endfunc
" nnoremap <C-n> :call NumberToggle()<cr>

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" font type
"set guifont=Consolas:h12.5:cANSI
" set guifont=Consolas\ for\ Powerline\ FixedD:h12.5
" set guifont=Monaco\ for\ powerline:h11.5:cANSI
set guifont=Monaco\ for\ powerline:h14:b:cANSI
" set guifont=Menlo\ for\ powerline:h16:b:cANSI
" set guifont=fixed:h11

" hightlight the column
" set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" mouse not flicker
set guicursor+=a:blinkon0

" " maximum window when startup
" if has('win32')
    " au GUIEnter * simalt ~x
" else
    " au GUIEnter * call MaximizeWindow()
" endif
" function! MaximizeWindow()
    " silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
" endfunction

winpos 0 0 "设置初始界面位置  
set lines=45 columns=95 "设置初始界面大小

" 恢复上次窗口位置和大小，缺点是会闪一下
" if has("gui_running")
  " function! ScreenFilename()
    " if has('amiga')
      " return "s:.vimsize"
    " elseif has('win32')
      " return $HOME.'\_vimsize'
    " else
      " return $HOME.'/.vimsize'
    " endif
  " endfunction

  " function! ScreenRestore()
    " " Restore window size (columns and lines) and position
    " " from values stored in vimsize file.
    " " Must set font first so columns and lines are based on font size.
    " let f = ScreenFilename()
    " if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      " let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      " for line in readfile(f)
        " let sizepos = split(line)
        " if len(sizepos) == 5 && sizepos[0] == vim_instance
          " silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          " silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          " return
        " endif
      " endfor
    " endif
  " endfunction

  " function! ScreenSave()
    " " Save window size and position.
    " if has("gui_running") && g:screen_size_restore_pos
      " let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      " let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            " \ (getwinposx()<0?0:getwinposx()) . ' ' .
            " \ (getwinposy()<0?0:getwinposy())
      " let f = ScreenFilename()
      " if filereadable(f)
        " let lines = readfile(f)
        " call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        " call add(lines, data)
      " else
        " let lines = [data]
      " endif
      " call writefile(lines, f)
    " endif
  " endfunction

  " if !exists('g:screen_size_restore_pos')
    " let g:screen_size_restore_pos = 1
  " endif
  " if !exists('g:screen_size_by_vim_instance')
    " let g:screen_size_by_vim_instance = 1
  " endif
  " autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  " autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
" endif

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
"set fileencodings=utf-8,gbk
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
"set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" menu messy cod
set imcmdline
set langmenu=zh_CN 
let $LANG = 'zh_CN.UTF-8' 
source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim 
source $VIMRUNTIME/vimrc_example.vim 
" 以下是默认window的快捷键，如ctrl+a,ctrl+c/v等，在mswin.vim文件中定义
source $VIMRUNTIME/mswin.vim 
behave mswin
" 去掉全选快捷键，恢复成递增
" noremap <C-A> <C-A> 

language message zh_CN.UTF-8
"==========================================
" others 其它设置
"==========================================
" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
autocmd! bufwritepost _vimrc.bundles source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>

" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 仅保留当前窗口，关闭其他所有
" nmap <leader>on :only<CR>

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================
" 主要按键重定义

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" " F3 显示可打印字符开关
" nnoremap <F3> :set list! list?<CR>
" F3 换行开关
nnoremap <F3> :set wrap! wrap?<CR>

" " F6 语法开关，关闭语法可以加快大文件的展示
" nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                " "    paste mode, where you can paste mass data
                                " "    that won't be autoindented

" " disbale paste mode when leaving insert mode
" au InsertLeave * set nopaste

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" 命令行模式增强，ctrl - a到行首， -e 到行尾
" cnoremap <C-j> <t_kd>
" cnoremap <C-k> <t_ku>
" cnoremap <C-a> <Home>
" cnoremap <C-e> <End>

" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" " 进入搜索Use sane regexes"
" nnoremap / /\v
" vnoremap / /\v

" " Keep search pattern at the center of the screen.
" nnoremap <silent> n nzz
" nnoremap <silent> N Nzz
" nnoremap <silent> * *zz
" nnoremap <silent> # #zz
" nnoremap <silent> g* g*zz

" 去掉搜索高亮
noremap <silent><BackSpace> :nohls<CR>

" " switch # *
" nnoremap # *
" nnoremap * #

" " for # indent, python文件中输入新行时#号注释不切回行首
" autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" " http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" " Zoom / Restore window.
" function! s:ZoomToggle() abort
    " if exists('t:zoomed') && t:zoomed
        " execute t:zoom_winrestcmd
        " let t:zoomed = 0
    " else
        " let t:zoom_winrestcmd = winrestcmd()
        " resize
        " vertical resize
        " let t:zoomed = 1
    " endif
" endfunction
" command! ZoomToggle call s:ZoomToggle()
" nnoremap <silent> <Leader>z :ZoomToggle<CR>

" tab/buffer相关

" " 切换前后buffer
" nnoremap [b :bprevious<cr>
" nnoremap ]b :bnext<cr>
" " 使用方向键切换buffer
" noremap <left> :bp<CR>
" noremap <right> :bn<CR>


" " tab 操作
" " http://vim.wikia.com/wiki/Alternative_tab_navigation
" " http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" " tab切换
" map <leader>th :tabfirst<cr>
" map <leader>tl :tablast<cr>

" map <leader>tj :tabnext<cr>
" map <leader>tk :tabprev<cr>
" map <leader>tn :tabnext<cr>
" map <leader>tp :tabprev<cr>

" map <leader>te :tabedit<cr>
" map <leader>td :tabclose<cr>
" map <leader>tm :tabm<cr>

" " normal模式下切换到确切的tab
" noremap <leader>1 1gt
" noremap <leader>2 2gt
" noremap <leader>3 3gt
" noremap <leader>4 4gt
" noremap <leader>5 5gt
" noremap <leader>6 6gt
" noremap <leader>7 7gt
" noremap <leader>8 8gt
" noremap <leader>9 9gt
" noremap <leader>0 :tablast<cr>

" " Toggles between the active and last active tab "
" " The first tab is always 1 "
" let g:last_active_tab = 1
" " nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" " nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" " vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
" autocmd TabLeave * let g:last_active_tab = tabpagenr()

" " 新建tab  Ctrl+t
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-t>     <Esc>:tabnew<CR>

" => 选中及操作改键

" " 调整缩进后自动选中，方便再次操作
" vnoremap < <gv
" vnoremap > >gv

" " y$ -> Y Make Y behave like other capitals
" map Y y$

" " 复制选中区到系统剪切板中
" vnoremap <leader>y "+y

" " auto jump to end of select
" " vnoremap <silent> y y`]
" " vnoremap <silent> p p`]
" " nnoremap <silent> p p`]

" " select all
" map <Leader>sa ggVG

" " 选中并高亮最后一次插入的内容
" nnoremap gv `[v`]

" " select block
" nnoremap <leader>v V`}

" " w!! to sudo & write a file
" cmap w!! w !sudo tee >/dev/null %

" " kj 替换 Esc
" inoremap kj <Esc>
" 插入模式下将前面输的单词变为大写
" inoremap <C-u> <esc>gUiwea
" 插入模式向前删除一个字符
inoremap <C-d> <Del>

" " 滚动Speed up scrolling of the viewport slightly
" nnoremap <C-e> 2<C-e>
" nnoremap <C-y> 2<C-y>


" " Jump to start and end of line using the home row keys
" " 增强tab操作, 导致这个会有问题, 考虑换键
" "nmap t o<ESC>k
" "nmap T O<ESC>j


" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" " Quickly edit/reload the vimrc file
" " nmap <silent> <leader>ev :e $MYVIMRC<CR>
" " nmap <silent> <leader>sv :so $MYVIMRC<CR>
" " edit vimrc/zshrc and load vimrc bindings
" nnoremap <leader>ev :vsp $MYVIMRC<CR>
" nnoremap <leader>ez :vsp ~/.zshrc<CR>
" nnoremap <leader>sv :source $MYVIMRC<CR>


"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" " 保存python文件时删除多余空格
" fun! <SID>StripTrailingWhitespaces()
    " let l = line(".")
    " let c = col(".")
    " %s/\s\+$//e
    " call cursor(l, c)
" endfun
" autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        " call setline(1, "\#!/usr/bin/env python")
        " call append(1, "\# encoding: utf-8")
        call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

"==========================================
" TEMP 设置, 尚未确定要不要
"==========================================

" beta
" https://dougblack.io/words/a-good-vimrc.html
set lazyredraw          " redraw only when we need to.

"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    " set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    "au GUIEnter * simalt ~x " maximum window
    set guioptions-=m " hide menu
    set guioptions-=T  " hide toolbar
    set guioptions+=e
    set guioptions+=c  " charater hint
    set guioptions-=r  " hide right scroll bar
    set guioptions-=L  " hide left scroll bar
    set guioptions-=b " hide bottom scroll bar
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" " 解决全屏时底部及右侧多余白线问题 {{{
" if has('gui_running') && has('libcall')
    " let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'
    " function! ToggleFullScreen()
        " call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
    " endfunction

    " "Alt+Enter
    " " map <A-Enter> <Esc>:call ToggleFullScreen()<CR>
    " map <F6> <Esc>:call ToggleFullScreen()<CR>

    " let g:VimAlpha = 240
    " function! SetAlpha(alpha)
        " let g:VimAlpha = g:VimAlpha + a:alpha
        " if g:VimAlpha < 180
            " let g:VimAlpha = 180
        " endif
        " if g:VimAlpha > 255
            " let g:VimAlpha = 255
        " endif
        " call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    " endfunction

    " " nmap <F1> <Esc>:call SetAlpha(3)<CR>
    " " nmap <F2> <Esc>:call SetAlpha(-3)<CR>

    " let g:VimTopMost = 0
    " function! SwitchVimTopMostMode()
        " if g:VimTopMost == 0
            " let g:VimTopMost = 1
        " else
            " let g:VimTopMost = 0
        " endif
        " call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
    " endfunction

    " "Shift+R
    " nmap <s-r> <Esc>:call SwitchVimTopMostMode()<CR>
" endif
" "}}}


" 设置标记一列的背景颜色和数字一行颜色一致
" hi! link SignColumn   LineNr
" hi! link ShowMarksHLl DiffAdd
" hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline



" 位置不能随便挪,会报错
set list " show specail symbol
set listchars=tab:>/,trail:•,extends:#,nbsp:. " Highlight problematic whitespace



" =============== code language settings ===========================
" ---python---
" autocmd BufNewFile *.py exec ":call SetPythonTitle()"
" func SetPythonTitle()
    " call setline(1,"#!/usr/bin/env python")
    " call append( line("."),"#-*- coding: utf-8 -*-" )
    " call append(line(".")+1," ")
    " call append(line(".")+2, "\# File Name: ".expand("%")) 
    " call append(line(".")+3, "\# Author: Ajioy") 
    " call append(line(".")+4, "\# mail: ajioy@hotmail.com") 
    " call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))    
" endfunc

" nmap <leader>i a // Ajioy <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

" 打开文件时恢复光标位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" 快速添加空行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" 快速移动当前行
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" 调整window窗口宽高，注意，只有当多个窗口时才有效
nnoremap <a-=>  :vertical res+10<cr><cr>
nnoremap <a-->  :vertical res-10<cr><cr>
nnoremap <a-]>  :res+10<cr><cr>
nnoremap <a-[>  :res-10<cr><cr>

"Quickly Run
""""""""""""""""""""""
map <F12> :call CompileRunGcc()<CR><CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'html'
        exec "!start cmd /c start explorer %"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    elseif &filetype == 'ruby'
        exec "!ruby %"
    endif
endfunc
" =============== code language end ===========================


" ======================= Plug begin===================================
" install bundles
if filereadable(expand("$VIM/_vimrc.bundles"))
  source $VIM/_vimrc.bundles
endif

" set pyxversion=3
" ======================= Plug end ==================================
