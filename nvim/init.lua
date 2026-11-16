-- Set leader key

vim.g.mapleader = " "
vim.filetype.add({ extension = {ts = "typescript"} })
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

-- Turn on autocomplete
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/completion") then
           vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
       end
   end,
})

vim.opt.rtp:prepend(lazypath)

-- Load basic settings
require("config.options")
require("config.keymaps")
-- Load plugins
require("lazy").setup({
    require("plugins.colorscheme"),
    require("plugins.lualine"),
    require("plugins.oil"),
    require("plugins.telescope"),
    require("plugins.which-key"),
    require("plugins.treesitter"),
    require("plugins.mini-pairs"),
    require("plugins.pug"),
    require("plugins.csharp"),
})
