cask "photonic" do
  version "1.3.5"
  sha256 "9be79fcbd119e9c06e4abc170a3c55114e9669c5f4abb0b57a0162a5c6c0a865"

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
