call plug#begin('~/.vim/plugged')

" Vim plug-in manager
Plug 'VundleVim/Vundle.vim'

" Themes
" vim dark theme
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'liuchengxu/space-vim-dark'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" start page logo
Plug 'mhinz/vim-startify'

" Search
" asynchronous searching
Plug 'dyng/ctrlsf.vim'
" search plugin
Plug 'mileszs/ack.vim'
" blur searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code format
Plug 'prettier/vim-prettier'

" Git plugin
Plug 'tpope/vim-fugitive'

" System exploder
Plug 'scrooloose/nerdtree'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> ':call mkdp#util#install()' }, 'for': 'markdown'  }
" markdown preview - mathjax support
Plug 'iamcco/mathjax-support-for-mkdp'

" Tools
" comment plugin
Plug 'preservim/nerdcommenter'
" display tags in a window
Plug 'majutsushi/tagbar'
" jump to define
Plug 'ternjs/tern_for_vim'
" file type icon
Plug 'ryanoasis/vim-devicons'
" highlight for brackets 
Plug 'luochen1990/rainbow'

" Font-end Plugin
" HTML code auto complete
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" JavaScript bundle for vim(provide syntax highlighting)
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" css3 bundle 
Plug 'hail2u/vim-css3-syntax'


" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'

call plug#end()

let g:startify_custom_header = [
\ '',
\ '		       _ _                     ____  __________',
\ '		  __ _(_) | _____  _ __   __ _|___ \|___ /___ /',
\ '		 / _` | | |/ / _ \|  _ \ / _` | __) | |_ \ |_ \',
\ '		| (_| | |   < (_) | | | | (_| |/ __/ ___) |__) |',
\ '		 \__, |_|_|\_\___/|_| |_|\__, |_____|____/____/',
\ '		    |_|                  |___/',
\ '',
\ '                        [ My Neo Vim   Author:JiaJin ]             ',
\ '',
\]

" rainbow config
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

filetype plugin indent on    " required

" vimrc 生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 语法高亮
syntax on

set cursorline
set wrap
set showcmd
set shiftwidth=4
set ts=2
"set clipboard=unnamedplus
vnoremap Y "+y

" 使用配色
" theme 1
"set background=dark
"colorscheme space-vim-dark
"hi Comment cterm=italic
" theme 2
colorscheme catppuccin-mocha

" 打开文件类型检测
filetype on

" 允许插件使用
filetype plugin on
filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:Powerline_symbols='fancy'
let Powerline_symbols='fancy'
set t_Co=256 " 状态栏就有颜色了
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1
let g:airline#extensions#tabline#enabled = 1

lua require("common")
lua require("edit")


" 设置实时搜索
set incsearch
" 开启大小写不敏感
set ignorecase
" 开始智能大小写
set smartcase

" 关闭兼容模式
set nocompatible
" 开启vim命令自身命令行模式智能补全
set wildmenu

" fzf setting
" Input on the top & use bat preview
let $FZF_DEFAULT_OPTS = "--layout=reverse --preview 'bat --color=always {}'"

" use floating window to open fzf
"let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
" set fzf window size
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" 查找
cnoreabbrev Ack Ack!
let g:ackprg = 'ag --vimgrep'
nnoremap <Leader>a :Ack!<Space>

" ts高亮
let g:typescript_indent_disable = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" vim-devicons
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font:h11
" vim-airline set fONT
let g:airline_powerline_fonts = 1

" Enable folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" python3 setup
let g:python3_host_prog = '/usr/local/bin/python3'

