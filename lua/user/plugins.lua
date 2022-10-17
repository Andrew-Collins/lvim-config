local M = {}
M.config = function()
  lvim.plugins = {
    {
      "simrat39/rust-tools.nvim",
      config = function()
        require("user.rust-tools").config()
      end,
      ft = { "rust", "rs" },
    },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("user.dapui").config()
      end,
      ft = { "c", "cpp", "python", "rust", "go" },
      event = "BufReadPost",
      requires = { "mfussenegger/nvim-dap" },
      disable = not lvim.builtin.dap.active,
    },
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.hop").config()
      end,
    },
    { "tpope/vim-surround" },
    {
      "tpope/vim-fugitive",
      cmd = {
        "G",
        "Git",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "GRemove",
        "GRename",
        "Glgrep",
        "Gedit"
      },
      ft = { "fugitive" }
    },
    { "tpope/vim-repeat" },
    { "p00f/nvim-ts-rainbow" },
    {
      "RishabhRD/nvim-cheat.sh",
      requires = "RishabhRD/popfix",
      config = function()
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
    },
  }
end

return M
