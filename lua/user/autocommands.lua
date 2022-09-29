local M = {}
local create_aucmd = vim.api.nvim_create_autocmd
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
M.config = function()
  vim.api.nvim_create_augroup("_lvim_user", {})
  -- Autocommands
  if lvim.builtin.nonumber_unfocus then
    create_aucmd("WinEnter", { group = "_lvim_user", pattern = "*", command = "set relativenumber number cursorline" })
    create_aucmd(
      "WinLeave",
      { group = "_lvim_user", pattern = "*", command = "set norelativenumber nonumber nocursorline" }
    )
  end
  create_aucmd("TermOpen", {
    group = "_lvim_user",
    pattern = "term://*",
    command = "lua require('user.keybindings').set_terminal_keymaps()",
  })
  create_aucmd("FileType", {
    group = "_lvim_user",
    pattern = "rust",
    callback = function()
      vim.keymap.set(
        "n",
        "<leader>H",
        "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='cargo clippy;read',count=2,direction='float'})<CR>"
      )
      vim.keymap.set("n", "<leader>lm", "<Cmd>RustExpandMacro<CR>")
      vim.keymap.set("n", "<leader>lH", "<Cmd>RustToggleInlayHints<CR>")
      vim.keymap.set("n", "<leader>le", "<Cmd>RustRunnables<CR>")
      vim.keymap.set("n", "<leader>lh", "<Cmd>RustHoverActions<CR>")
      vim.keymap.set("n", "<leader>lc", "<Cmd>RustOpenCargo<CR>")
    end,
  })
end
return M
