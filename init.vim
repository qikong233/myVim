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

call plug#end()
filetype plugin indent on    " required

" vimrc 生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" 语法高亮
syntax on

" 使用配色
" theme 1
"set background=dark
"colorscheme gruvbox
" theme 2
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

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

" 进入打开nerdtree
"let g:nerdtree_tabs_open_on_console_startup=1

" 设置自己的leader
let mapleader=","

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
			\ ]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

inoremap jj <esc>

"coc-prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
