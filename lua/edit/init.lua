--markdown preview
vim.g.mkdp_theme = 'dark'
vim.g.mkdp_combine_preview_auto_refresh = 1
vim.g.mkdp_filetypes = {'markdown'}

vim.api.nvim_set_keymap("n", "<C-s>", "<Plug>MarkdownPreview", { noremap = false, silent = false })
vim.api.nvim_set_keymap("n", "<C-p>", "<Plug>MarkdownPreviewToggle", { noremap = false, silent = false })
