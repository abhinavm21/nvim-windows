-- local status, jdtls = pcall(require, 'jdtls')
-- if not status then
--   return
-- end
-- local extendedClientCapabilities = jdtls.extendedClientCapabilities

-- require('dap.ext.vscode').load_launchjs()
-- local bundles = {
--     vim.fn.glob("C:/Users/280687/AppData/Local/nvim-data/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar",1),
-- }

-- vim.list_extend(bundles, vim.split(vim.fn.glob("C:/Users/280687/AppData/Local/nvim-data/mason/share/java-test/*.jar", 1), "\n"))

-- function nnoremap(rhs, lhs, bufopts, desc)
--     bufopts.desc = desc
--     vim.keymap.set("n", rhs, lhs, bufopts)
-- end

-- config['on_attach'] = function(client, bufnr)
--     -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
--     -- you make during a debug session immediately.
--     -- Remove the option if you do not want that.
--     require('jdtls').setup_dap({ hotcodereplace = 'auto' })
-- end
-- local on_attach = function(client, bufnr)
--     -- Regular Neovim LSP client keymappings
--     local bufopts = { noremap=true, silent=true, buffer=bufnr }
--     -- nvim-dap
--     nnoremap("<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Set breakpoint")
--     nnoremap("<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Set conditional breakpoint")
--     nnoremap("<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Set log point")
--     nnoremap('<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear breakpoints")
--     nnoremap('<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', "List breakpoints")

--     nnoremap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "Continue")
--     nnoremap("<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", "Step over")
--     nnoremap("<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", "Step into")
--     nnoremap("<leader>do", "<cmd>lua require'dap'.step_out()<cr>", "Step out")
--     nnoremap('<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect")
--     nnoremap('<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", "Terminate")
--     nnoremap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "Open REPL")
--     nnoremap("<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", "Run last")
--     nnoremap('<leader>di', function() require"dap.ui.widgets".hover() end, "Variables")
--     nnoremap('<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, "Scopes")
--     nnoremap('<leader>df', '<cmd>Telescope dap frames<cr>', "List frames")
--     nnoremap('<leader>dh', '<cmd>Telescope dap commands<cr>', "List commands")
--     nnoremap("<leader>vc", jdtls.test_class, bufopts, "Test class (DAP)")
--     nnoremap("<leader>vm", jdtls.test_nearest_method, bufopts, "Test method (DAP)")

-- end

 -- local config = {
 --     on_attach = on_attach,
 --     init_options = {
 --         bundles = {} --bundles
 --     },
--     
 --   settings = {
 --     java = {
 --       signatureHelp = { enabled = true },
 --       extendedClientCapabilities = extendedClientCapabilities,
 --       maven = {
 --         downloadSources = true,
 --       },
 --       referencesCodeLens = {
 --         enabled = true,
 --       },
 --       references = {
 --         includeDecompiledSources = true,
 --       },
 --       inlayHints = {
 --         parameterNames = {
 --           enabled = 'all', -- literals, all, none
 --         },
 --       },
 --       format = {
 --         enabled = false,
 --       },
 --     },
 --   },

 --   require('jdtls').start_or_attach(config)
-- }


local status, jdtls = pcall(require, 'jdtls')
if not status then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
os.execute("mkdir" .. workspace_dir)

-- local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:C:/Users/280687/AppData/Local/nvim-data/mason/packages/jdtls/lombok.jar',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    'C:/Users/280687/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar',
    '-configuration',
    'C:/Users/280687/AppData/Local/nvim-data/mason/packages/jdtls/config_win',
    '-data', workspace_dir,
  },
  root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },

  settings = {
    java = {
      home = 'C:/jdk-21.0.2/bin',
      eclipse = {
          downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-17",
            path = "C:/OpenJDK-17.0.11/jdk-17.0.1",
          }
          -- ,{
          --   name = "JavaSE-17",
          --   path = "/Users/ivanermolaev/Library/Java/JavaVirtualMachines/temurin-17.0.4/Contents/Home",
          -- }
        }
      },
      -- extendedClientCapabilities = extendedClientCapabilities,
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
          enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = 'all', -- literals, all, none
        },
      },
      format = {
        enabled = true,
        settings = {
          -- Use Google Java style guidelines for formatting
          -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
          -- and place it in the ~/.local/share/eclipse directory
          url = "C:/Users/280687/AppData/Local/nvim/lang-servers/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
      },
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org"
      },
    },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {},
  },
  handlers = {
      ['language/status'] = function() end,
      -- FIXME: Maybe check this again? https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/jdtls.lua#L117
  },
}

config['on_attach'] = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<leader>co', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
    vim.keymap.set('n', '<leader>crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
    vim.keymap.set('v', '<leader>crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = 'Extract Variable' })
    vim.keymap.set('n', '<leader>crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
    vim.keymap.set('v', '<leader>crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = 'Extract Constant' })
    vim.keymap.set('v', '<leader>crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })
  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window_above_cur_line = false,
    padding = '',
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
end


require('jdtls').start_or_attach(config)
