return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        -- C++ with both cppcheck and clang-tidy
        cpp = { "cppcheck", "clangtidy" },
        c = { "cppcheck", "clangtidy" },
        java = { "checkstyle" },
        python = { "flake8" },
        typescript = { "eslint" },
        javascript = { "eslint" },
        vue = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
      }

      -- Configure clang-tidy with specific checks
      lint.linters.clangtidy.args = {
        "--checks=*,-fuchsia-*,-google-*,-zircon-*,-abseil-*,-llvm-header-guard",
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged", "TextChangedI" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    "greggh/claude-code.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup({
        window = {
          position = "vertical", -- Move to right side
          split_ratio = 0.4, -- 40% of screen width
        },
        keymaps = {
          toggle = {
            normal = false, -- Disable default normal mode keymap
            terminal = "<C-,>", -- Keep terminal toggle
          },
          window_navigation = true, -- Enable window navigation keymaps
          scrolling = true, -- Enable scrolling keymaps
        }
      })
    end
  },

  {
    "Civitasv/cmake-tools.nvim",
    lazy = true,
    init = function()
      local loaded = false
      local function check()
        local cwd = vim.uv.cwd()
        if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
          require("lazy").load({ plugins = { "cmake-tools.nvim" } })
          loaded = true
        end
      end
      check()
      vim.api.nvim_create_autocmd("DirChanged", {
        callback = function()
          if not loaded then check() end
        end,
      })
    end,
    opts = {
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=On" },
      cmake_build_directory = "build",
    },
  },

  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    opts = {},
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
