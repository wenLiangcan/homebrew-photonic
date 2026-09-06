cask "photonic" do
  version "1.5.2"
  sha256 "6c9e665857e65ca3621063f11d235cca5aba0299be9d3b1c8ff7413d85da5d2e"

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
