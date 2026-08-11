cask "carrel" do
  version "1.132.0+0.1.0"
  sha256 "68778cde0b02e5e0d81b212d396922d96f8fd444773b3f1a64fcef92d2db6479"

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
