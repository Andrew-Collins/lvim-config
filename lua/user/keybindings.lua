local M = {}
-- keymappings [view all the defaults by pressing <leader>Lk]
M.config = function()
  lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
  lvim.builtin.which_key.mappings["?"] = { "<cmd>Cheat<CR>", " Cheat.sh" }
  if lvim.builtin.dap.active then
    lvim.builtin.which_key.mappings["dB"] = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      "Set Breakpoint" }
    lvim.builtin.which_key.mappings["dl"] = { "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
      "Log Point" }
    lvim.builtin.which_key.mappings["dE"] = { "<cmd>lua require('dap').set_exception_breakpoints()<cr>",
      "Break Exceptions" }
    lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require('dapui').eval()<cr>", "Eval" }
    lvim.builtin.which_key.mappings["dU"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" }
    lvim.builtin.which_key.mappings["ds"] = {
      "<cmd>lua if vim.bo.filetype == 'rust' then vim.cmd[[RustDebuggables]] else require'dap'.continue() end<CR>",
      "Start"
    }
  end
end
M.set_terminal_keymaps = function()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end
M.set_hop_keymaps = function()
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("", "S", "<cmd>HopChar2MW<cr>", opts)
  vim.api.nvim_set_keymap("", "s", "<cmd>HopWordMW<cr>", opts)
  -- vim.api.nvim_set_keymap("", "L", "<cmd>HopLineMW<cr>", opts)
  vim.api.nvim_set_keymap(
    "n",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
    ,
    {}
  )
  vim.api.nvim_set_keymap("n", "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
    , {})
  vim.api.nvim_set_keymap("o", "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
    , {})
  vim.api.nvim_set_keymap("o", "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
    , {})
  vim.api.nvim_set_keymap("", "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
    , {})
  vim.api.nvim_set_keymap("", "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
    , {})
end
return M
