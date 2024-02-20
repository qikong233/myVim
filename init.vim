call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'prettier/vim-prettier'
Plug 'dyng/ctrlsf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mileszs/ack.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'liuchengxu/space-vim-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

"Dart/Flutter
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

filetype plugin indent on    " required

" vimrc 生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

if !exists('g:vscode')
nnoremap <TAB> :NERDTreeMirror<CR>
nnoremap <TAB> :NERDTreeToggle<CR>
endif

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

" 设置自己的leader
let mapleader=","

" 分屏
nmap <Leader>v :vsplit<CR>
" 保存退出
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

if !exists('g:vscode')
" 设置界面跳转
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
else 
" vscode配置
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
endif
" 行尾 行首
nmap H ^
nmap L $

" 设置实时搜索
set incsearch
" 开启大小写不敏感
set ignorecase
" 开始智能大小写
set smartcase

" 关闭兼容模式
set nocompatible
" 清除当前搜索高亮
nmap <Leader><space> :nohlsearch<CR>
" 开启vim命令自身命令行模式智能补全
set wildmenu
" 格式化
nmap <Leader>p :Prettier

" fzf setting
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

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
nmap <Leader>s :FZF<CR>

" coc config
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-yank',
			\ 'coc-css',
			\ 'coc-highlight',
			\ 'coc-python',
			\ ]

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"coc-prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
hi HighlightedyankRegion term=bold ctermbg=0 guibg=	#FF7F50

"markdown preview
nmap <silent> <F8> <Plug>MarkdownPreview       
imap <silent> <F8> <Plug>MarkdownPreview        
nmap <silent> <F9> <Plug>StopMarkdownPreview    
imap <silent> <F9> <Plug>StopMarkdownPreview    

"代码移动
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z 

" 快速调整
nmap J 3j
nmap K 3k

" tagbar
nmap <F5> :TagbarToggle<CR>

" 输入模式下映射
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <DELETE>

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
" 全选
nmap <C-a> ggVG

" 查找
cnoreabbrev Ack Ack!
let g:ackprg = 'ag --vimgrep'
nnoremap <Leader>a :Ack!<Space>

" ts高亮
let g:typescript_indent_disable = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" css高亮
autocmd CursorHold * silent call CocActionAsync('highlight')

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

