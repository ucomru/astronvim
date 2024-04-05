---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = { -- vim.opt.<key>
        -- list = true, -- show listchars, default - false
        listchars = { tab = ">·", eol = "·" },
        colorcolumn = "80",
      },
      g = { -- vim.g.<key>
        -- :lua =vim.b.gitsigns_status_dict["root"] -- package root path
        -- :echo g:python3_host_prog | :lua =vim.g.python3_host_prog
        python3_host_prog = vim.fn.expand("~/.venv/bin/python"),
      },
    },
    mappings = {
      -- vim.keymap.set()
      v = { -- visual mode
        ["x"] = { '"_x' },
      },
      i = { -- insert mode
        -- im: ^V + key -> shortkey
        ["<C-s>"] = { "<Esc><Cmd>w<CR>" },
        ["<C-q>"] = { "<Esc><C-Q>" },
      },
      n = { -- normal mode
        ["x"] = { '"_x' },
        ["X"] = { '"_X' },
        ["|"] = false, -- :nunmap | :map - all map
        ["\\"] = { false, desc = "Alt" },
        ["\\d"] = { '"_d', desc = "Alt" },
        ["\\dd"] = { '"_dd', desc = "Alt" },
        -- shortkeys --
        -- ~/.local/share/nvim/lazy/AstroNvim/lua/astronvim/plugins/_astrocore_mappings.lua
        ["<M-s>"] = { "<cmd>w!<cr>", desc = "Force write" },
        ["<M-q>"] = { "<cmd>qa!<cr>", desc = "Force quit" },
        ["<C-s>"] = { "<Cmd>w<CR>", desc = "Save" },
        ["<C-q>"] = { function() local _bufs = #vim.t.bufs; require("astrocore.buffer").close();
            if _bufs == 1 and #vim.t.bufs == 1 then vim.cmd("conf q") end end, desc = "Smart close buffer" },
        ["<C-\\>"] = { function() require('smart-splits').move_cursor_previous() end, desc = "Move to previous split" },
        -- :bf[irst] :bl[ast] :[#]bn[ext] :[#]bp[rev] :ls[buffers] :b # - alternate C-^ :lua =#vim.t.bufs
        ["<M-j>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Prev buffer [b :bp" },
        ["<M-k>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer ]b :bn" },
        ["<M-J>"] = { function() require("astrocore.buffer").move(-vim.v.count1) end, desc = "Move buffer tab left <b" },
        ["<M-K>"] = { function() require("astrocore.buffer").move(vim.v.count1) end, desc = "Move buffer tab right >b" },
        ["<M-C-[>"] = { "<M-j>" },
        ["<M-C-]>"] = { "<M-k>" },
        -- leader --
        ["<Leader>\\"] = { "<Cmd>split<cr>", desc = "Horizontal Split" },
        ["<Leader>|"] = { "<Cmd>vsplit<cr>", desc = "Vertical Split" },
        ["<Leader>."] = { function() vim.opt.list = not(vim.opt.list:get()) end, desc = "Toggle list mode" }, -- se list!
        ["<Leader>,"] = { function() if vim.opt.colorcolumn:get()[1] then vim.opt.colorcolumn = ""
            else vim.opt.colorcolumn = "80" end end, desc = "Toggle column cc=80" },
        ["<Leader>m"] = { "<Cmd>if &cole | se cole=0 | else | se cole=2 | endif<CR>", desc = "Toggle markdown syntax" },
        ["<Leader>M"] = { "<Cmd>se ft=markdown cole=2 cc=80 ts=2 sw=2<CR>", desc = "Set filetype markdown" },
        ["<Leader>I"] = { "<Cmd>$pu!='\nvim:ft=markdown:cole=2:cc=80:ts=2:sw=2'<CR>", desc = "Insert filetype at EOL" },
      },
    },
  },
}
