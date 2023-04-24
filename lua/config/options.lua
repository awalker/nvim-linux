-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- only set this on windows...
vim.cmd('set clipboard += "unnamedplus"')

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.scrolloff = 8
-- vim.opt.title = true

-- Treesitter folding
vim.wo.foldmethod = "expr"
--vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
