---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable: missing-fields
    config = {
      -- python (pyright --> basedpyright)
      basedpyright = {
        before_init = function(_, c)
          local pythonPath = vim.g.python3_host_prog
          -- if virtual environment detected
          if os.getenv "VIRTUAL_ENV" then pythonPath = vim.fn.exepath "python" end
          -- safely set `pythonPath` in the `pyright` settings
          if not c.settings then c.settings = {} end
          if not c.settings.python then c.settings.python = {} end
          c.settings.python.pythonPath = pythonPath
        end,
      },
      -- rust --
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
           cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = 'dev', },
              extraArgs = { "--profile", "rust-analyzer", },
            },
            -- Add clippy lints for Rust
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
          },
        },
      },
    },
  },
}
