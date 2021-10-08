local function init()
    require'nvim-web-devicons'.setup {
        default = true;
    }

    vim.g.nvim_tree_quit_on_open = 1 --0 by default, closes the tree when you open a file
    vim.g.nvim_tree_icons = {
        default=        '',
        symlink=        '',
        git= {
            unstaged=     "✗",
            staged=       "✓",
            unmerged=     "",
            renamed=      "➜",
            untracked=    "★",
            deleted=      "",
        },
        folder= {
            arrow_open=   "",
            arrow_closed= "",
            default=      "",
            open=         "",
            empty=        "",
            empty_open=   "",
            symlink=      "",
            symlink_open= "",
        },
        lsp= {
            hint= "",
            info= "",
            warning= "",
            error= "",
        }
    }

    vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true})
    vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true})

    require'nvim-tree'.setup {
        -- disables netrw completely
        disable_netrw       = true,
        -- hijack netrw window on startup
        hijack_netrw        = true,
        -- open the tree when running this setup function
        open_on_setup       = false,
        -- will not open on setup if the filetype is in this list
        ignore_ft_on_setup  = {},
        -- closes neovim automatically when the tree is the last **WINDOW** in the view
        auto_close          = false,
        -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
        open_on_tab         = false,
        -- hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor       = true,
        -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
        update_cwd          = true,
        -- show lsp diagnostics in the signcolumn
        lsp_diagnostics     = true,
        -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
        view = {
            -- width of the window, can be either a number (columns) or a string in `%`
            width = 30,
            -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
            side = 'left',
            -- if true the tree will resize itself after opening a file
            auto_resize = true,
            mappings = {
                -- custom only false will merge the list with the default mappings
                -- if true, it will only use your list to set the mappings
                custom_only = false,
                -- list of mappings to set on the tree manually
                list = {}
            }
        },
        update_focused_file = {
            -- enables the feature
            enable      = true,
            -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
            -- only relevant when `update_focused_file.enable` is true
            update_cwd  = true,
            -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
            -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
            ignore_list = {}
        }
    }

end

return {
    init=init
}
