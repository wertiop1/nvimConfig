vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"

vim.g.mapleader = " "

vim.keymap.set('n','<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n','<leader>w', ':write<CR>')
vim.keymap.set('n','<leader>q', ':quit<CR>')

vim.pack.add({
				{src = "https://github.com/vague-theme/vague.nvim"},
				{src = "https://github.com/stevearc/oil.nvim"},
				{src = "https://github.com/nvim-mini/mini.pick"},
				{src = "https://github.com/neovim/nvim-lspconfig"},
				{src = "https://github.com/OXY2DEV/markview.nvim"},
})

vim.cmd("colorscheme vague")
