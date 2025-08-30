# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is an NvChad-based Neovim configuration that uses the NvChad framework as a plugin. The architecture follows NvChad's modular approach:

- **init.lua**: Main entry point that bootstraps lazy.nvim, imports NvChad, and loads user configurations
- **lua/**: Core configuration directory
  - **configs/**: Plugin-specific configuration files (lazy.lua, lspconfig.lua, conform.lua)
  - **chadrc.lua**: NvChad-specific configuration (themes, UI settings)
  - **options.lua**: Vim options (extends nvchad.options)
  - **mappings.lua**: Key mappings (extends nvchad.mappings) 
  - **autocmds.lua**: Auto commands (extends nvchad.autocmds)
  - **plugins/init.lua**: User plugin specifications

## Plugin Management

Uses lazy.nvim as the plugin manager with these key characteristics:
- Plugins are lazy-loaded by default (`defaults = { lazy = true }`)
- NvChad is imported as `"NvChad/NvChad"` with branch `"v2.5"`
- User plugins are defined in `lua/plugins/init.lua`
- Plugin configurations are in `lua/configs/` directory

## Configuration Pattern

The configuration extends NvChad's defaults rather than replacing them:
- Each config file requires the corresponding nvchad module first
- User customizations are added after the nvchad imports
- Comments indicate where to add custom configurations

## Key Components

- **Theme**: Uses "yoru" theme configured in `lua/chadrc.lua`
- **LSP**: Configured for HTML and CSS servers via `lua/configs/lspconfig.lua`
- **Formatting**: Uses conform.nvim with stylua for Lua files
- **Additional plugins**: 
  - trouble.nvim for diagnostics management
  - telescope-file-browser.nvim for file browsing
- **Disabled plugins**: Many default Vim plugins are disabled for performance

## Custom Keymappings

- `<leader>fb` (Space + f + b): Opens telescope file browser
- `;` in normal mode: Enter command mode (`:`)
- `jk` in insert mode: Exit to normal mode
- `<leader>x` (Space + x): Close current buffer (NvChad default)

## Working with this Configuration

When modifying this config:
1. Always extend NvChad's configurations rather than replacing them
2. User customizations go in the designated sections after nvchad requires
3. New plugins should be added to `lua/plugins/init.lua`
4. Plugin-specific configs belong in `lua/configs/` directory
5. The config inherits NvChad's lazy-loading patterns for performance

## Common Issues

- **base46_cache errors**: Ensure `vim.g.base46_cache` is correctly set in `init.lua` (not `base43_cache`)
- **Plugin loading**: Use `:Lazy sync` to update plugins after configuration changes
- **Cache issues**: Delete `~/.local/share/nvim/base46_cache/` and restart if theme issues occur