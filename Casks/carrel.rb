cask "carrel" do
  version "1.134.0+0.1.0"
  sha256 "a71300c1e6459febd228371f284b2238916c69ccf0b354ffd1641372bf2c9ed4"

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
