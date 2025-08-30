require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)

-- Configure clangd for better CMake integration
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--compile-commands-dir=build", -- Look for compile_commands.json in build directory
  },
  root_markers = { "compile_commands.json", ".clangd", ".git", "CMakeLists.txt" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}

-- read :h vim.lsp.config for changing options of lsp servers 
