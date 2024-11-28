vim.opt.encoding = "utf-8"

--keybinding

vim.g.mapleader = ","

--quick jump
vim.api.nvim_set_keymap(
		"n",
		"J",
		"3j",
		{ noremap = false, silent = false }
)
vim.api.nvim_set_keymap(
		"n",
		"K",
		"3k",
		{ noremap = false, silent = false }
)

--insert mode move cousor
vim.api.nvim_set_keymap(
		"i",
		"<C-h>",
		"<Left>",
		{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
		"i",
		"<C-j>",
		"<Down>",
		{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
		"i",
		"<C-k>",
		"<Up>",
		{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
		"i",
		"<C-l>",
		"<Right>",
		{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
		"i",
		"<C-d>",
		"<DELETE>",
		{ noremap = true, silent = false }
)

--select all
vim.api.nvim_set_keymap(
		"i",
		"<C-a>",
		"ggVG",
		{ noremap = false, silent = false }
)

--split window in right
vim.api.nvim_set_keymap(
		"n",
		"<Leader>v",
		":vsplit<CR>",
		{ noremap = false, silent = false }
)

--save and quit
vim.api.nvim_set_keymap(
		"n",
		"<Leader>w",
		":w<CR>",
		{ noremap = false, silent = false }
)
vim.api.nvim_set_keymap(
		"n",
		"<Leader>q",
		":q<CR>",
		{ noremap = false, silent = false }
)

--window jump
vim.api.nvim_set_keymap(
		"n",
		"<C-h>",
		"<C-w>h",
		{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
		"n",
		"<C-j>",
		"<C-w>j",
		{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
		"n",
		"<C-k>",
		"<C-w>k",
		{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
		"n",
		"<C-l>",
		"<C-w>l",
		{ noremap = true, silent = false }
)

--move to line head and tail
vim.api.nvim_set_keymap(
		"n",
		"H",
		"^",
		{ noremap = false, silent = false }
)
vim.api.nvim_set_keymap(
		"n",
		"L",
		"$",
		{ noremap = false, silent = false }
)

--move code
vim.api.nvim_set_keymap(
		"n",
		"<C-j>",
		"mz:m+<cr>`z",
		{ noremap = false, silent = false }
)
vim.api.nvim_set_keymap(
		"n",
		"<C-k>",
		"mz:m-2<cr>`z",
		{ noremap = false, silent = false }
)
vim.api.nvim_set_keymap(
		"v",
		"<C-j>",
		":m'>+<cr>`<my`>mzgv`yo`z",
		{ noremap = false, silent = false }
)
vim.api.nvim_set_keymap(
		"v",
		"<C-k>",
		":m'<-2<cr>`>my`<mzgv`yo`z",
		{ noremap = false, silent = false }
)

--nerdTree
vim.api.nvim_set_keymap(
		"",
		"<TAB>",
		":NERDTreeMirror<CR>",
		{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
		"",
		"<TAB>",
		":NERDTreeToggle<CR>",
		{ noremap = true, silent = false }
)

--cancel highlight
vim.api.nvim_set_keymap(
		"n",
		"<Leader><space>",
		":nohlsearch<CR>",
		{ noremap = false, silent = false }
)

--code format
vim.api.nvim_set_keymap(
		"",
		"<space>p",
		":Prettier<CR>",
		{ noremap = false, silent = false }
)

--fzf
vim.api.nvim_set_keymap(
		"",
		"<Leader>s",
		":FZF<CR>",
		{ noremap = false, silent = false }
)

--tagbars
vim.api.nvim_set_keymap(
		"n",
		"<Leader>t",
		":TagbarToggle<CR>",
		{ noremap = false, silent = false }
)

