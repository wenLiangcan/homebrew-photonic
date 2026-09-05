cask "photonic" do
  version "1.5.0"
  sha256 "5a842086866abb58a9a5f7d3fdcf000d5ff8f4e5e3658a40d88286d2d345b548"

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
