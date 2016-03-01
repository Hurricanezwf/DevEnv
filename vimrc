"######## this is a vim configuration file ############

"################ vundle ################"
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle, required

    Plugin 'taglist.vim'    
    Plugin 'winmanager'
    Plugin 'Visual-Mark'
    Plugin 'neocomplcache'
    Plugin 'kshenoy/vim-signature'
    Plugin 'fatih/vim-go'

    filetype plugin indent on    " required
    " Put your non-Plugin stuff after this line




" ================ winmanager 的样式设置，包括文件管理器和taglist =============
let g:winManagerWindowLayout='FileExplorer|TagList'
nnoremap wm :WMToggle<cr>

" 试试按下mm键打标签，实现不同行之间的跳转
" m[a-zA-Z]  打标签
" '[a-zA-Z]  跳转到标签为止
" '.         最后一次变更的地方
" ''         跳回原来的地方
" m<space>   去除所有标签

" neocomplcache配置（自动补全）
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1


if v:lang =~ "utf8$" || v:lang =~"UTF-8$"  
      set fileencodings=ucs-bom,utf-8,latin1  
endif

:set bs=indent,eol,start        "allow backspaceing over everythings in insert mode
:set viminfo='20,\"50       "read/write a .viminfo file, don't store more than 50 lines of registers

:set history=50             "keep 50 lines of command line history
:set ruler                  "show the cursor position all the time

"----------- personal setting ----------"

"设置语法高亮
"set syntax highlight
:set syntax=on

"设置粘贴不破坏原有格式
":set paste

set fdm=marker

"设置不自动折行
:set nowrap

"显示行号
:set number

"显示括号匹配
:set showmatch

"缩进相关
:set autoindent
:set smartindent

"设置当文件被改动时自动载入
:set autoread

"代码补全
:set completeopt=preview,menu

"突出显示当前行
:set cursorline

"显示状态栏
:set laststatus=2

"配色方案
:colorscheme desert

"设定支持256色
:set t_Co=256
"设置tab键宽度
:set tabstop=4

"统一缩进为4
set tabstop=4       "tab所占空格数
set shiftwidth=4    "自动缩进所用空格数
set expandtab       "将tab转换为空格,可用set list显示空格和tab符,可用ret将所有tab转换为空格
"set noexpandtab    "不将tab转换为空格

set ignorecase      "搜索忽略大小写
set incsearch       "输入字符串就显示匹配点

"允许折叠
:set foldenable

"手动折叠
:set foldmethod=manual

"set file encoding support
set fileencodings=utf8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


if has("mouse")
    set mouse=iv        "在insert和visual模式使用鼠标定位
endif



"-------------键盘映射-------------"
"配置F3为保存快捷键(set F3 as save)
inoremap <F3> <ESC>:w<CR>
nnoremap <F3> :w<CR>
"配置F1为注释快捷键
inoremap <F1> <ESC>^i//
nnoremap <F1> ^i//<ESC>
"配置F11为取消注释快捷键
inoremap <F11> <ESC>^d2<Right>A
nnoremap <F11> ^d2<Right>
