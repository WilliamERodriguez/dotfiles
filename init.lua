-- ================================================================================================================================================== --
-- 1. 	LEADER KEY (Must be at the very top)
-- ================================================================================================================================================== --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ================================================================================================================================================== --
-- 1.a. "Kill Switch"
-- ================================================================================================================================================== --
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    pcall(vim.treesitter.stop)
  end,
})

-- ================================================================================================================================================== --
-- 2. GLOBAL SETTINGS & ERROR FIXES
-- ================================================================================================================================================== --
vim.g.loaded_nvim_treesitter = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- ================================================================================================================================================== --
-- 3. BOOTSTRAP LAZY.NVIM
-- ================================================================================================================================================== --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- ================================================================================================================================================== --
-- 4. PLUGIN LIST
-- ================================================================================================================================================== --
require("lazy").setup({
  spec = {
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  },
  rocks = { enabled = false },
})

-- ================================================================================================================================================== --
-- 5. PLUGIN SETUP
-- ================================================================================================================================================== --
require("nvim-tree").setup()
vim.cmd([[colorscheme tokyonight]])

-- ================================================================================================================================================== --
-- 6. KEYBINDINGS
-- ================================================================================================================================================== --
-- Space + e: Toggle Space Bar
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

-- Space + f + f: Find Files (Telescope)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true })

-- Space + f + g: Search text inside files (Grep)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { silent = true })

-- Space + w: Fast Save
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })

print("Config Loaded Successfully!")
