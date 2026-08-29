cask "carrel" do
  version "1.135.0+0.1.1"
  sha256 "fa1cf0916cd9a153c8c71a8c9b409a5712f2537a4d472a47a17e032dcee0805e"

  url "https://github.com/minhuw/carrel/releases/download/v#{version}/Carrel-darwin-arm64-#{version}.zip"
  name "Carrel"
  desc "Slim, AI-free desktop code editor derived from Code - OSS"
  homepage "https://github.com/minhuw/carrel"

  depends_on arch: :arm64

  app "Carrel.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Carrel.app"]
  end

  zap trash: [
    "~/.carrel",
    "~/Library/Application Support/Carrel",
    "~/Library/Caches/carrel",
    "~/Library/Preferences/com.carrel.editor.plist",
    "~/Library/Saved Application State/com.carrel.editor.savedState",
  ]
end
