return {
    --- Status Line ---
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            extensions = {
                "neo-tree",
                "toggleterm",
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch", "diff"},
                lualine_c = {
                    {
                        "filename",
                        path = 3,
                        symbols = {
                            modified = "[+]",
                            readonly = "[RO]",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        }
                    },
                    "diagnostics"
                },
                lualine_x = {
                    "location",
                    function()
                        if vim.bo.expandtab then
                            return "Spaces: "..vim.bo.shiftwidth
                        else
                            return "Tab Size: "..vim.bo.shiftwidth
                        end
                    end,
                },
                lualine_y = {"encoding", "fileformat", "filetype", "lsp_status"},
                lualine_z = {"progress"},
            }
        }
    },
    -- Buffer Line
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
            { "[b", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
            { "]b", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
        },
        opts = function()
            MiniBufremove = require("mini.bufremove")
            return {
                options = {
                    tab_size = 12,
                    numbers = "ordinal",
                    close_command = MiniBufremove.delete,
                    right_mouse_command = MiniBufremove.delete,
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = nil,
                    indicator = { style = "underline" },
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true
                        }
                    },
                    separator_style = "slant",
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {"close"}
                    },
                }
            }
        end
    },
    --- File Tree ---
    {
        "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        event = "VeryLazy",
        keys = {
            {"<leader>e", ":Neotree toggle<CR>", mode = "n", desc = "Toggle Neo-tree"},
        },
    },
    --- Terminal ---
    {
        "akinsho/toggleterm.nvim", version = false,
        opts = {
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 1,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "single",
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                }
            }
        },
    },
    {
        "echasnovski/mini.notify", version = "*",
        opts = {
        }
    },
    {
        "echasnovski/mini.icons", version = "*",
        opts = {
        }
    }
}