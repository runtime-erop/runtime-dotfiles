return {
  {
    "NvChad/base46",
    lazy = false,
    commit = "2d0f7c4", -- This is a known working version
    config = function()
      local base46 = require("base46")
      base46.load_all_highlights()
      -- Set transparency
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", blend = 30 })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000", blend = 30 })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", blend = 30 })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "configs.conform",
  },

  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>ot", "<cmd>Outline<CR>", desc = "Toggle outline" },
      { "<leader>oo", "<cmd>OutlineOpen<CR>", desc = "Focus on outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },

  {
    "moll/vim-bbye",
    cmd = "Bdelete",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
      "InsertLeave",
    },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        python = { "ruff" },
        cpp = { "clangtidy" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    "tversteeg/registers.nvim",
    cmd = "Registers",
    config = true,
    keys = {
      { '"', mode = { "n", "v" } },
      { "<C-R>", mode = "i" },
    },
    name = "registers",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "nil",
        "nixpkgs-fmt",
        "ruff",
        "python-lsp-server",
      },
    },
  },
  { "nvchad/volt", lazy = true },
  { "nvchad/menu", lazy = true },
  {
    "echasnovski/mini.animate",
    version = "*",
    lazy = false,
    config = function()
      require("mini.animate").setup {
        cursor = { timing = require("mini.animate").gen_timing.linear({ duration = 15, unit = "total" }) },
        scroll = { timing = require("mini.animate").gen_timing.linear({ duration = 15, unit = "total" }) },
        resize = { timing = require("mini.animate").gen_timing.linear({ duration = 15, unit = "total" }) },
        open = { timing = require("mini.animate").gen_timing.linear({ duration = 15, unit = "total" }) },
        close = { timing = require("mini.animate").gen_timing.linear({ duration = 15, unit = "total" }) },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = {
      "VimBeGood",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require "configs.telescope"
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('dashboard').setup({
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            { icon = ' ', icon_hl = '@variable', desc = 'Files', group = 'Label', action = 'Telescope find_files', key = 'f' },
          },
          footer = { 'Welcome to Neovim!' },
        },
      })
      -- Emit a user event so nvim-tree can react
      vim.api.nvim_exec_autocmds('User', { pattern = 'DashboardReady' })
    end,
  },
  {
    "goolord/alpha-nvim",
    enabled = false, -- Disabled by default, will be enabled if dashboard fails
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      
      -- Set header
      dashboard.section.header.val = {
        "Welcome to Neovim",
        "",
      }
      
      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "󰙅  Open Tree", ":NvimTreeToggle<CR>"),
        dashboard.button("f", "󰈞  Find Files", ":Telescope find_files<CR>"),
        dashboard.button("r", "󰈢  Recent Files", ":Telescope oldfiles<CR>"),
      }
      
      -- Set footer
      dashboard.section.footer.val = {
        "Neovim loaded",
      }
      
      -- Send config to alpha
      alpha.setup(dashboard.opts)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
}
