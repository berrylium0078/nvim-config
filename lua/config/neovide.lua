--- GUI
vim.o.guifont = "FiraCode Nerd Font,Noto Sans Mono CJK SC,Noto Color Emoji:h10" -- font & fallbacks
vim.g.neovide_opacity = 0.9 --- window opacity
vim.g.neovide_fullscreen = true
vim.g.neovide_position_animation_length = 0.15  -- animation duration for window movement i.e. :split

--- Cursor Animation
vim.g.neovide_cursor_trail_size = 1.0 -- cursor jumps to destination with maximum trail size
vim.g.neovide_cursor_animation_length = 0.05 -- cursor move animation duration
vim.g.neovide_cursor_short_animation_length = 0.01 -- cursor's animation when traveling short distance, i.e. typing
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_unfocused_outline_width = 0.05 -- when unfocused, a block cursor will be rendered as an outline

--- Input Method (only available in certain modes)
vim.g.neovide_input_ime = false

local function set_ime(args)
    if args.event:match("Enter$") then
        vim.g.neovide_input_ime = true
    else
        vim.g.neovide_input_ime = false
    end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })
local function set_ime(args) vim.g.neovide_input_ime = true end
local function unset_ime(args) vim.g.neovide_input_ime = false end
local function toggle_ime() vim.g.neovide_input_ime = (vim.g.neovide_input_ime == false) end

-- always disable input method outside the following modes
vim.api.nvim_create_autocmd({ "InsertLeave", "TermLeave", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = unset_ime
})
-- always enable in insert mode & terminal mode
vim.api.nvim_create_autocmd({ "InsertEnter", "TermEnter" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime
})
-- only enable when searching
vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
    group = ime_input,
    pattern = "[/\\?]", 
    callback = set_ime
})
-- ...but you can still toggle them in command mode (start disabled), by pressing <C-Space>.
-- This might be useful during substitution.
-- implementation is inside keymaps.lua