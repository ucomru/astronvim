-- if true then return {} end
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python-ruff" },
}
