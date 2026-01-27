-- 1. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Plugin List
require("lazy").setup({
  spec = {
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    -- We are leaving Treesitter out for now to stop the red errors
  },
  rocks = { enabled = false },
})

-- 3. Global Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true

-- 4. Setup Plugins & Theme
require("nvim-tree").setup()
vim.cmd([[colorscheme tokyonight]])

-- 5. Keybindings
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

print("Config Loaded Successfully!")
