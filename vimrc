"-------------------------------- 插件列表 ---------------------------------"
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle, required

    Plugin 'taglist.vim'    
    Plugin 'winmanager'
    Plugin 'Visual-Mark'
    Plugin 'neocomplcache'							"自动补全插件
    Plugin 'kshenoy/vim-signature'					"打标签的插件
	Plugin 'kien/ctrlp.vim'							"搜索文件的
	Plugin 'wting/autojump'							"通过j快速跳转目录
	Plugin 'majutsushi/tagbar'						"生成右侧代码框架栏
    Plugin 'fatih/vim-go'							"执行:GoInstallBinaries,最好翻墙

    filetype plugin indent on    " required
	filetype plugin on
    " Put your non-Plugin stuff after this line




"------------------------------- winmanager插件配置----------------------"
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer'
nnoremap wm :WMToggle<cr>


" ------------------------- neocomplcache插件配置 ------------------------"
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1
" 补全弹出窗口选中条目
hi PmenuSel ctermbg=yellow ctermfg=black


" --------------------------- CtrlP插件配置 -----------------------------"
let g:ctrlp_map = '<c-p>'				"默认按ctrl+p呼出ctrlp插件的混合查找模式
let g:ctrlp_cmd = 'CtrlPMixed'


"-------------------------- vim-def配置 ---------------------------------"
"let g:godef_split=2

"let g:go_highlight_trailing_whitespace_error = 0
"let g:go_fmt_autosave = 0
"let g:go_fmt_fail_silently = 1

let mapleader = ","
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>d <Plug>(go-def-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap gi :GoImports<CR>
au FileType go nmap gl :GoMetaLinter<CR>
au FileType go nmap gc :GoCallees<CR>
au FileType go nmap gr :GoReferrers<CR>



"-------------------------- vim个性化配置 --------------------------------"
set bs=indent,eol,start        	"allow backspaceing over everythings in insert mode
set viminfo='20,\"50       	   	"read/write a .viminfo file, don't store more than 50 lines of registers
set history=50             		"keep 50 lines of command line history
set ruler                  		"show the cursor position all the time
set syntax=on					"设置语法高亮
"set paste						"设置粘贴不破坏原有格式
"set nowrap						"设置不自动折行
set number						"显示行号
set showmatch					"显示括号匹配
set autoindent					"自动智能缩进
set smartindent
set autoread					"设置当文件被改动时自动载入
set noswf						"不使用交换文件
set completeopt=preview,menu	"代码补全
set cursorline					"突出显示当前行
set laststatus=2				"显示状态栏
colorscheme molokai	     	  	"配色方案
"colorscheme desert
set t_Co=256					"设定支持256色
set tabstop=4       			"tab所占空格数
set shiftwidth=4    			"自动缩进所用空格数
"set expandtab       			"将tab转换为空格,可用set list显示空格和tab符,可用ret将所有tab转换为空格
set noexpandtab    				"不将tab转换为空格
set ignorecase      			"搜索忽略大小写
set smartcase					"有一个大写字母，则切换到大小写敏感
set incsearch       			"输入字符串就显示匹配点
set nowrapscan      			"当搜索到结尾时就不再搜索
"set hlsearch					"设置高亮搜索
set foldenable					"允许折叠
set foldmethod=manual			"手动折叠
set fileencodings=utf8,ucs-bom,gbk,gb2312	"set file encoding support
set termencoding=utf-8
set encoding=utf-8


if v:lang =~ "utf8$" || v:lang =~"UTF-8$"  
      set fileencodings=ucs-bom,utf-8,latin1  
endif


if has("mouse")
    set mouse=iv        "在insert和visual模式使用鼠标定位
endif




"---------------------------------- 键盘映射---------------------------------"
"配置F3为保存快捷键(set F3 as save)
inoremap <F3> <ESC>:GoImports:w<CR>
nnoremap <F3> :GoImports<CR>:w<CR>
"配置F2为注释快捷键
inoremap <F2> <ESC>^i//
nnoremap <F2> ^i//<ESC>
"配置F11为取消注释快捷键
inoremap <F11> <ESC>^d2<Right>A
nnoremap <F11> ^d2<Right>
"配置F8为tagbar的toggle快捷键
inoremap <F8> <ESC>:TagbarToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
"配置^o为go的输入代码提示
imap <C-o> <C-x><C-o>
"配置触发和关闭搜索高亮的按键
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *: set hlsearch<cr>
noremap i :set nohlsearch<cr>i
noremap o :set nohlsearch<cr>o





"--------------------------------- 操作提示 -------------------------------------"
" 试试按下mm键打标签，实现不同行之间的跳转
" m[a-zA-Z]  打标签
" '[a-zA-Z]  跳转到标签为止
" '.         最后一次变更的地方
" ''         跳回原来的地方
" m<space>   去除所有标签


" 试试在某函数的名字上按gd,看能不能跳转到其定义处,再按ctrl+o返回原处
" 试试使用ctrl+p呼出查找文件功能，然后通过ctrl+j或者ctrl+k进行文件选择，最后按ctrl+t在新标签打开选择的文件._
