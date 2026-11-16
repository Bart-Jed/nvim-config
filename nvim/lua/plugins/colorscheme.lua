return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "moon",            -- "storm", "moon", "night" or "day"
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        })
        vim.cmd.colorscheme("tokyonight")
    end,
}
