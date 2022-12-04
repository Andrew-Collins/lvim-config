-- Neovim
-- =========================================
require("user.neovim").config()
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.use_icons = true
lvim.leader = "space"
-- Customization
-- =========================================
-- lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.sidebar = { active = true } -- enable/disable sidebar
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "json",
  "lua",
  "python",
  "rust",
  "yaml",
}
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
-- Language Specific
-- =========================================
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
-- Debugging
-- =========================================
if lvim.builtin.dap.active then
  require("user.dap").config()
end
-- Additional Plugins
-- =========================================
require("user.plugins").config()
-- Autocommands
-- =========================================
require("user.autocommands").config()
-- Additional keybindings
-- =========================================
require("user.keybindings").config()
