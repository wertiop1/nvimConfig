vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.termguicolors = true

-- Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- scrolling
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.undofile = true
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", "<cmd>update<CR><cmd>source %<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>")
vim.keymap.set("n", "<leader>z", function()
  vim.o.wrap = not vim.o.wrap
  vim.o.linebreak = vim.o.wrap
  vim.o.breakindent = vim.o.wrap
end, { desc = "Toggle line wrap" })

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/saghen/blink.lib" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/echasnovski/mini.pairs" },
  --{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/roerohan/mark.nvim"},
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/jtprogru/pack-ui.nvim" },
  { src = "https://github.com/alec-gibson/nvim-tetris" },
  { src = "https://github.com/rbtnn/vim-game_engine" },
  { src = "https://github.com/rbtnn/vim-mario" },
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
require("pack_ui").setup({
  border = "rounded",
  title = "vim.pack",
  max_width = 100,
  width_ratio = 0.9,
  height_ratio = 0.85,
  auto_check = true,
  auto_update = false,
  keymaps = {
    prefix = "<leader>p",
    status = "s",
    update_all = "U",
    window = {
      close = { "q", "<Esc>" },
      toggle_mark = { "<Space>", "<Tab>" },
      mark_all = { "a" },
      update_marked = { "u" },
      update_all = { "U" },
      refresh = { "r", "R" },
      changelog = { "<CR>", "K" },
    },
  },
})
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.pick").setup()
require("oil").setup()
--require("render-markdown").setup()
require('mark').setup()

vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>n", function()
  local oil = require("oil")

  if vim.bo.filetype == "oil" then
    vim.cmd("close")
  else
    vim.cmd("leftabove vsplit")
    vim.cmd("vertical resize 30")
    oil.open()
  end
end, { desc = "Toggle Oil" })

vim.lsp.enable({ "lua_ls", "pyright", "ruff", "ccls" })
vim.keymap.set("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format File" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, {
  desc = "Code action",
})

vim.cmd.colorscheme("vague")
vim.cmd("highlight StatusLine guibg=NONE")
