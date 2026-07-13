local o = vim.opt
o.signcolumn = "yes:1"
o.termguicolors = true
o.swapfile = false
o.autoindent = true
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.list = true
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.wrap = false
o.cursorline = true
o.scrolloff = 8
o.inccommand = "nosplit"
o.undodir = os.getenv('HOME') .. '/.vim/undodir'
o.undofile = true
o.completeopt = { 'menuone', 'popup', 'noinsert' }
o.winborder = 'rounded'


vim.cmd.filetype('plugin indent on')


