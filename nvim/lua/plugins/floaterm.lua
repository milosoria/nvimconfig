local function init()
    vim.g.floaterm_width=0.8
    vim.g.floaterm_height=0.8
    vim.g.floaterm_wintitle=0
    vim.g.floaterm_autoclose=1
end


return {
    init = init
}