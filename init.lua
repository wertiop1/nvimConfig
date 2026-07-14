vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.clipboard = "unnamedplus"

-- Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.swapfile = false
vim.o.winborder = "rounded"

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", "<cmd>update<CR><cmd>source %<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/saghen/blink.lib" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/echasnovski/mini.pairs" },
})

-- require("blink.cmp").setup()
local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
  keymap = {
    preset = "super-tab",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" }
  }
})
require("mini.pairs").setup()
require("mini.pick").setup()
require("oil").setup()

vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

vim.lsp.enable({ "lua_ls", "pyright", "ccls" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.cmd.colorscheme("vague")
vim.cmd("highlight StatusLine guibg=NONE")
