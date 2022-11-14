local M = {}
M.config = function()
  local dap = require('dap')
  local extension_path = os.getenv("HOME") .. '/.local/share/nvim/mason/packages/codelldb/extension/'
  local codelldb_path = extension_path .. 'adapter/codelldb'
  dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = codelldb_path,
      args = { "--port", "${port}" },
    },
  }
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = os.getenv("HOME") .. '/.local/share/nvim/mason/bin/OpenDebugAD7', -- adjust as needed
  }
  dap.configurations.rust = {
    {
      name = "Default",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
  }
  dap.configurations.c = {
    {
      name                    = 'OpenOCD',
      type                    = 'cppdbg',
      request                 = 'launch',
      MIMode                  = 'gdb',
      miDebuggerServerAddress = 'localhost:3333',
      miDebuggerPath          = '/opt/esp/tools/xtensa-esp32s3-elf/esp-2021r2-patch5-8.4.0/xtensa-esp32s3-elf/bin/xtensa-esp32s3-elf-gdb',
      miDebuggerArgs          = '-x gdbinit',
      cwd                     = '${workspaceFolder}',
      program                 = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      logging                 = {
        trace = true,
        traceResponse = true,
        engineLogging = true
      }
    }
  }
end
return M
