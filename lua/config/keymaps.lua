-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
-- set primary key
vim.g.mapleader = "\\"
vim.g.maplocalleader = ""

-----------------
-- Normal mode --
-----------------

-- Toggle Fullscreen for neovide
vim.keymap.set('n', '<F11>', function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end, opts)

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set("n", "<esc>", function() vim.cmd("noh") end, opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-----------------
-- Insert mode --
-----------------

-- I have mapped Capslock as extra Escape (Shift+Capslock as Capslock)
-- but you can also use the following:
-- vim.keymap.set('i', 'jk', '<ESC>', opts)

-----------------
-- Terminal mode --
-----------------
-- ToggleTerm
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", opts)
vim.keymap.set("t", "<C-l>", "<Cmd> wincmd l<CR>", opts)
vim.keymap.set("t", "<C-h>", "<Cmd> wincmd h<CR>", opts)
vim.keymap.set("t", "<C-j>", "<Cmd> wincmd j<CR>", opts)
vim.keymap.set("t", "<C-k>", "<Cmd> wincmd k<CR>", opts)

-----------------
-- Command mode --
-----------------

-- toggle IME in command mode
local function toggle_ime() vim.g.neovide_input_ime = (vim.g.neovide_input_ime == false) end
vim.keymap.set('c', '<C-Space>', toggle_ime, opts)
