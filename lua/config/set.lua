vim.opt.guicursor = ""
vim.opt.errorbells = false

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.swapfile = false;
vim.opt.undofile = true
vim.opt.undodir = os.getenv( "HOME" ) .. '/.vim/undodir'
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.g.mapleader = " "

vim.opt.termguicolors = true

vim.opt.cmdheight = 1

vim.opt.updatetime = 50

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.vim_markdown_folding_disabled=1
