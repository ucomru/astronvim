-- https://github.com/AstroNvim/user_example
-- https://neovim.io/doc/user/lua.html#lua-vim

---@type LazySpec
return {
  -- colorsheme --
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  -- surround --
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Empty to use defaults --
        })
    end
  },
  -- "ray-x/go.nvim"
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "████████ ██ AstroNvim",
        "   ██                ",
        "   ██    ██ ███   ███",
        "   ██    ██ ██ █ █ ██",
        "   ██    ██ ██  █  ██",
      }
      return opts
    end,
  },
}
