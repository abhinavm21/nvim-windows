local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug ('folke/tokyonight.nvim')
Plug ('nvim-tree/nvim-web-devicons')
Plug ('nvim-tree/nvim-tree.lua')
Plug ('nvim-lualine/lualine.nvim')
Plug ('akinsho/toggleterm.nvim', {['tag'] = '*'})

Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug ('nvim-treesitter/nvim-treesitter-textobjects') Plug ('theprimeagen/harpoon') Plug ('mbbill/undotree') Plug ('tpope/vim-fugitive')

--Git
Plug ('tpope/vim-fugitive')
Plug ('tpope/vim-rhubarb')
Plug ('lewis6991/gitsigns.nvim')

-- java
Plug ('mfussenegger/nvim-dap')
Plug ('mfussenegger/nvim-jdtls')
Plug ('nvim-lua/plenary.nvim')


Plug ('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.x' })
Plug ('mbbill/undotree')

-- LSP Mains 
Plug ('williamboman/mason.nvim')
Plug ('VonHeikemen/lsp-zero.nvim')
        
-- LSP Support
Plug ( 'neovim/nvim-lspconfig' )
Plug ( 'williamboman/mason-lspconfig.nvim' )
Plug ( 'onsails/lspkind.nvim' )
-- Autocompletion
Plug ( 'hrsh7th/nvim-cmp' )
Plug ( 'hrsh7th/cmp-buffer' )
Plug ( 'hrsh7th/cmp-path' )
Plug ( 'hrsh7th/cmp-vsnip')
Plug ( 'saadparwaiz1/cmp_luasnip' )
Plug ( 'hrsh7th/cmp-nvim-lsp' )
Plug ( 'hrsh7th/cmp-nvim-lua' )
Plug ( 'ray-x/lsp_signature.nvim' )

-- Snippets
Plug ( 'L3MON4D3/LuaSnip' )
Plug ( 'rafamadriz/friendly-snippets' )
Plug ( 'hrsh7th/vim-vsnip')
Plug ( 'hrsh7th/vim-vsnip-integ')

--Other 
Plug ("folke/trouble.nvim")
Plug ('rmagatti/alternate-toggler')
Plug ('windwp/nvim-autopairs')
Plug ('mg979/vim-visual-multi')
Plug ('tpope/vim-surround')
Plug ('tpope/vim-commentary')
Plug ('gcmt/wildfire.vim')
Plug ('lukas-reineke/indent-blankline.nvim')
Plug ('echasnovski/mini.indentscope')
Plug ('b0o/incline.nvim')
Plug ('iamcco/markdown-preview.nvim', { ['do'] =  'cd app && npx --yes yarn install' })

-- Database

Plug ('tpope/vim-dadbod')
Plug ('kristijanhusak/vim-dadbod-ui')
Plug ('kristijanhusak/vim-dadbod-completion')

vim.call('plug#end')
