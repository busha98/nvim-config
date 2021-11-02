local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'
local root_pattern = lspconfig.util.root_pattern

-- configs.tsserver = {
--   default_config = {
--     cmd = { "prisma-language-server", "--stdio" },
--     filetypes = { "prisma" },
--     root_dir = root_pattern(".git", "package.json"),
--     settings = {
--       prisma = {
--         prismaFmtBinPath = ""
--       }
--     }
--   };
-- }

lspconfig.tsserver.setup{}

