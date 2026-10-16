cask "dealer" do
  version "0.1.0"
  sha256 "38afc57e6d57318f27858c9ad1e9987d3226181f13dc1c18a12b4c662aede8e7"

  url "https://github.com/chantastic/dealer/releases/download/v#{version}/Dealer.dmg"
  name "Dealer"
  desc "Menu bar link router that opens URLs in the right Google Chrome profile"
  homepage "https://github.com/chantastic/dealer"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Dealer.app"
  binary "#{appdir}/Dealer.app/Contents/MacOS/deal"

  uninstall quit: "dev.chan.dealer"

  zap trash: [
    "~/.config/dealer",
    "~/Library/Caches/dev.chan.dealer",
    "~/Library/HTTPStorages/dev.chan.dealer",
    "~/Library/Preferences/dev.chan.dealer.plist",
  ]
end
