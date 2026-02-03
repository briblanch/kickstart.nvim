-- iOS/macOS development support
-- Requires these homebrew packages:
--   brew install xcode-build-server swiftlint swiftformat xcbeautify
--
-- After opening an iOS project, run in the project root:
--   xcode-build-server config -scheme <YourScheme> -workspace *.xcworkspace
-- or:
--   xcode-build-server config -scheme <YourScheme> -project *.xcodeproj
--
-- This generates buildServer.json which allows sourcekit-lsp to understand your project.

return {
  {
    'wojciechkulik/xcodebuild.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      logs = {
        auto_open_on_success_tests = false,
        auto_open_on_failed_tests = false,
        auto_open_on_success_build = false,
        auto_open_on_failed_build = true,
      },
      code_coverage = {
        enabled = true,
      },
    },
  },
}
