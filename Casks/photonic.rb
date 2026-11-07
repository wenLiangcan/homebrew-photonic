cask "photonic" do
  version "2.0.0"
  sha256 "32a838b14c23f1773a3f68136884c7db79ebdfb8733ffb87e49068e9c5eb652f"

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
