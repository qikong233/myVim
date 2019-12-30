call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'prettier/vim-prettier'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dyng/ctrlsf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
Plug 'ayu-theme/ayu-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mileszs/ack.vim'

call plug#end()
filetype plugin indent on    " required

" vimrc 生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

nnoremap <TAB> :NERDTreeMirror<CR>
nnoremap <TAB> :NERDTreeToggle<CR>

" 语法高亮
syntax on

set cursorline
set wrap
set showcmd
"set clipboard=unnamedplus
vnoremap Y "+y

" 使用配色
" theme 1
set background=dark
colorscheme gruvbox
" theme 2
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

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

" 设置界面跳转
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
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

" coc config
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-yank',
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
nnoremap <Leader>a :Ack!<Space>
