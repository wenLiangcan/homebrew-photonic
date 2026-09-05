cask "photonic" do
  version "1.3.6"
  sha256 "8a167d62b0fbecf5bc6d5d7cdc6c0b9a43d3465f6b03c44ad049ef688b0dee15"

  url "https://github.com/wenLiangcan/Photonic/releases/download/v#{version}/Photonic-#{version}.dmg"
  name "Photonic"
  desc "Lightweight native image viewer"
  homepage "https://wenliangcan.github.io/Photonic/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Photonic.app"

  caveats <<~EOS
    Photonic is currently distributed without Apple notarization. If macOS
    prevents it from opening, remove quarantine from the installed app:

      xattr -dr com.apple.quarantine /Applications/Photonic.app
  EOS
end
