-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, 'packer')
if not status then
	return
end

-- add list of plugins to install
return packer.startup({
	function(use)
        use { 'wbthomason/packer.nvim' }
        use { 'nvim-lua/plenary.nvim' }
    	use { 'nvim-tree/nvim-web-devicons' }
        use {
            'lewis6991/impatient.nvim',
            config = function()
              require('impatient').enable_profile()
            end,
          }

	    -- colorschemes
        use {'catppuccin/nvim', as = 'catppuccin'}

        -- statusline & buffer
        use { 'nvim-lualine/lualine.nvim' }
        use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons' }

		-- file explorer
		use { 'nvim-tree/nvim-tree.lua' }

        -- telescope
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }

		-- autocompletion
		use { 'hrsh7th/nvim-cmp' } -- completion plugin
		use { 'hrsh7th/cmp-buffer' } -- source for text in buffer
		use { 'hrsh7th/cmp-path' } -- source for file system paths

		use { 'hrsh7th/vim-vsnip' } -- VSCode(LSP)'s snippet feature in vim/nvim.
		use { 'hrsh7th/cmp-nvim-lua' }
		use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
		use { 'hrsh7th/cmp-vsnip' }
        use { 'folke/neodev.nvim' }

		-- snippets
		use { 'L3MON4D3/LuaSnip' } -- snippet engine
		use { 'saadparwaiz1/cmp_luasnip' } -- for autocompletion
		use { 'rafamadriz/friendly-snippets' } -- useful snippets

		-- managing & installing lsp servers, linters & formatters
		use { 'williamboman/mason.nvim' } -- in charge of managing lsp servers, linters & formatters
		use { 'williamboman/mason-lspconfig.nvim' } -- bridges gap b/w mason & lspconfig

		-- configuring lsp servers
		use { 'neovim/nvim-lspconfig' } -- easily configure language servers
		use { 'hrsh7th/cmp-nvim-lsp' } -- for autocompletion
		use { 'glepnir/lspsaga.nvim', branch = 'main' } -- enhanced lsp uis
		use { 'jose-elias-alvarez/typescript.nvim' } -- additional functionality for typescript server (e.g. rename file & update imports)
		use { 'onsails/lspkind.nvim' } -- vs-code like icons for autocompletion

		-- formatting & linting
		use { 'jose-elias-alvarez/null-ls.nvim' } -- configure formatters & linters
		use { 'jayp0521/mason-null-ls.nvim' } -- bridges gap b/w mason & null-ls

        --debugging
        use { 'mfussenegger/nvim-dap' }
        use { 'rcarriga/nvim-dap-ui' }
        use { 'theHamsta/nvim-dap-virtual-text' }
        use { 'nvim-telescope/telescope-dap.nvim' }

        -- TreeSitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        -- auto closing
        use { 'windwp/nvim-autopairs' } -- autoclose parens, brackets, quotes, etc...
        use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' } -- autoclose tags

        -- git integration
        use { 'lewis6991/gitsigns.nvim' } -- show line modifications on left hand side


		-- view git diff
		use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

        -- hop
		use {
			'phaazon/hop.nvim',
			branch = 'v2',
			config = function()
				require('hop').setup()
			end,
		}

        -- utils
        use { 'tpope/vim-surround' } -- add, delete, change surroundings
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end,
         }
        use { 'lukas-reineke/indent-blankline.nvim' }

		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	-- using floating window
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'rounded' })
			end,
		},
	},
})
