-- Global Settings
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Relative numbers for faster jumping
vim.opt.mouse = 'a'             -- Enable mouse support
vim.opt.ignorecase = true       -- Ignore case in search
vim.opt.smartcase = true        -- ...unless search has a capital
vim.opt.shiftwidth = 4          -- Size of an indent
vim.opt.tabstop = 4             -- Number of spaces tabs count for
vim.opt.termguicolors = true    -- Enable 24-bit RGB color

-- Theme
vim.cmd('colorscheme habamax')

-- Integrity Check
print("Config Loaded Successfully!")
