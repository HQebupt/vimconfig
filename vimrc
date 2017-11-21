
" -----------------------------------
" Vundle Setting
" -----------------------------------
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'moll/vim-node'                     " Tools and environment to make Vim superb for developing with Node.js. Like Rails.vim for Node.
Plugin 'scrooloose/nerdtree'               " A tree explorer plugin for vim.
Plugin 'Xuyuanp/nerdtree-git-plugin'       " git plugin"
Plugin 'Raimondi/delimitMate'              " provides insert mode auto-completion for quotes, parens, brackets
Plugin 'pangloss/vim-javascript'           " Vastly improved Javascript indentation and syntax support in Vim
Plugin 'scrooloose/syntastic'              " Syntax checking hacks for vim
Plugin 'xolox/vim-misc'                    " Miscellaneous auto-load Vim scripts
Plugin 'xolox/vim-colorscheme-switcher'    " Makes it easy to quickly switch between color schemes in Vim
Plugin 'Yggdroot/indentLine'               " A Vim plugin for visually displaying indent levels in code
Plugin 'Shougo/neocomplcache.vim'          " Ultimate auto-completion system for Vim.
Plugin 'ntpeters/vim-better-whitespace'    " Better whitespace highlighting for Vim

call vundle#end()            " required
filetype plugin indent on    " required*/*/

" ---------------------------------------
" General Configuration
" ---------------------------------------
set autoindent         "自动缩进
syntax on              "语法高亮度显示
set nowrap             "指定不折行"
set smartindent        "基于autoindent的一些改进"
set tabstop=4          "一个TAB字符占多少个空格"
set softtabstop=4      "每次退格将删除X个空格"
set number             "换行
set nobackup           "设置不自动备份文件"
set hlsearch           "设置搜索结果高亮"
set expandtab          "使用空格代替TAB"
set smarttab           "只按一下 Backspace 就删除 4 个空格"
set shiftwidth=4       "使用每层缩进的空格数"
set cursorline         "高亮显示当前行
set cursorcolumn       "高亮显示当前列
set incsearch          "开启实时搜索功能
set ignorecase         "搜索时大小写不敏感
set smartcase          "大写区分，小写不区分
set gcr=a:block-blinkon0 "禁止光标闪烁
set wildignore+=**/node_modules/**,**/.git/,**/*.swp,*.o,*~,*.pyc,*.swp,*.bak,*.class,*.svn,*.git   "禁止在vimgrep中查找以下目录

" --------------------------------------
" 快捷键定义
" --------------------------------------
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

"定义快捷键到行首(line begin)
nmap <Leader>r ^
"定义快捷键到行尾(line end)
nmap <Leader>e $

"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
"定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
"及时生效vimrc 文件
map <Leader>ss :source ~/.vimrc<CR>

map <Leader>f :set foldenable<CR> "打开折叠"

" -------------------------------------
" 整行移动
" ------------------------------------
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" --------------------------------------
" Color & Font
" --------------------------------------
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
set t_Co=256

" --------------------------------------
" Max length config
" --------------------------------------
highlight ColorColumn ctermbg=256 guibg=#2d2d2d

autocmd BufEnter *.py,*.js,*.json,*.sh,*.c,*.h,*.java,.vimrc,vimrc,_vimrc
            \ exec ":call AutoSetFileLineLimit()"

function! AutoSetFileLineLimit()
    let &colorcolumn=join(range(100,100),",")
endfunc

" ---------------------------------------
" vim-node config
" ---------------------------------------


" ---------------------------------------
" javascript config
" ---------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


" ---------------------------------------
" Plugin neocompcache
" 还需要更多的配置
" ---------------------------------------
let g:neocomplcache_enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" ---------------------------------------
" Plugin syntastic
" ---------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args = "/home/qiang/.jshintrc"
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--config=/home/qiang/.flake8.ini'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

noremap <Leader>ch :SyntasticCheck<CR>:Errors<CR>    " 手动检查
noremap <Leader>re :SyntasticReset<CR>              " 关闭错误提示
noremap <leader>sn :lnext<CR>
noremap <leader>sp :lprevious<CR>

" -------------------------------------
" Plugin: vim-colorscheme-switcher
" ------------------------------------
" F8 is used to switch color scheme by default
let g:colorscheme_switcher_define_mappings = 1


" -------------------------------------
" Plugin: nerdtree
" ------------------------------------
map <Leader>ts :NERDTreeToggle<CR>      "使用NERDTree查看工程文件。设置快捷键，速记：tree show
"设置NERDTree子窗口位置
let NERDTreeWinSize=36
"设置NERDTree子窗口位置
let NERDTreeWinPos="left"
"显示隐藏文件
let NERDTreeShowHidden=1
"NERDTree子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
"删除文件时自动删文件对应额buffer
let NERDTreeAutoDeleteBuffer=1
"隐藏.pyc文件
let NERDTreeIgnore=['\.pyc$','\~$']


" -------------------------------------
" set vim color scheme in tmux
" ------------------------------------
if exists('$TMUX')
    set term=screen-256color
endif

"""""""""""""""""""""""""""""""
" => Plugin: indentLine
"""""""""""""""""""""""""""""""
" indentLine 代码缩进线标志线
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
map <F11> :IndentLinesToggle<CR> "开关"

"""""""""""""""""""""""""""""""
" => Plugin: indentLine
"""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red
" 强制使用jk
inoremap jk <Esc>`^:StripWhitespace<CR>
inoremap <Esc> <Nop>
