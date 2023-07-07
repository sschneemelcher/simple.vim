call plug#begin()
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'numirias/semshi'
    Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()

colorscheme catppuccin-mocha
set nu rnu

lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "rust", "tsx", "go" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
	disable = { "python" },
    },
})
EOF
