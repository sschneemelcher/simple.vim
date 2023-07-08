call plug#begin()
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    " Plug 'numirias/semshi'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    Plug 'hrsh7th/cmp-emoji'
    Plug 'ray-x/cmp-treesitter'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
call plug#end()

colorscheme catppuccin-mocha
set nu rnu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nohlsearch
set incsearch
set smartindent
set noswapfile
set undofile
set undodir=~/.vim/undodir'
set scrolloff=8
set signcolumn
set colorcolumn=80
set termguicolors
set cursorline
set cmdheight=1
set updatetime=50

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>

lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "rust", "tsx", "go", "python" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        -- disable = { "python" },
    },
})

require('cmp').setup({
  sources = {
    { name = 'emoji' },
    { name = 'treesitter' },
  },
})
EOF
