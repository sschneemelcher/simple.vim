call plug#begin()
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'HiPhish/nvim-ts-rainbow2'
    Plug 'nvim-treesitter/nvim-treesitter-context'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'

    Plug 'hrsh7th/cmp-emoji'
    " Plug 'sschneemelcher/cmp-treesitter'
    Plug '~/projects/treels'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

    Plug 'numToStr/Comment.nvim'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'

    Plug 'folke/twilight.nvim'
    Plug 'folke/neodev.nvim'
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


nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>

lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "rust", "tsx", "go", "python" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = false,
            highlight_current_scope = { enable = true },
        },
        smart_rename = {
            enable = true,
                keymaps = {
                    smart_rename = "grr",
                },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gd",
                list_definitions = "gD",
                list_definitions_toc = "gO",
                goto_next_usage = "gn",
                goto_previous_usage = "gp",
            },
        },
    },
    rainbow = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
})

require'treesitter-context'.setup{
  enable = true,
}

local cmp = require'cmp'

cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
  sources = {
    -- { name = 'emoji' },
    -- { name = 'treesitter' },
    { name = 'treels' },
    -- { name = 'nvim_lsp' },
  },
})

-- require('neodev').setup({
--     library = {
--         enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
--         -- these settings will be used for your Neovim config directory
--         runtime = true, -- runtime path
--         types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
--         plugins = true, -- installed opt or start plugins in packpath
--         -- you can also specify the list of plugins to make available as a workspace library
--         -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
--       },
--       setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
--       -- for your Neovim config directory, the config.library settings will be used as is
--       -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
--       -- for any other directory, config.library.enabled will be set to false
--       override = function(root_dir, options) end,
--       -- With lspconfig, Neodev will automatically setup your lua-language-server
--       -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
--       -- in your lsp start options
--       lspconfig = true,
--       -- much faster, but needs a recent built of lua-language-server
--       -- needs lua-language-server >= 3.6.0
--       pathStrict = true,
-- })
-- 
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--  require('lspconfig')['lua_ls'].setup {
--     capabilities = capabilities
--   }
require('Comment').setup()

EOF
