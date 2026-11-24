cask "blueprint-plus" do
  version "1.1.1"
  sha256 "2dcd6426160e729a3c879e5f35fec0fc7887f974df2bf93a38b85c95456b3395"

  url "https://github.com/lukeadair/blueprint-plus-macos/releases/download/v#{version}/Blueprint+-#{version}.dmg"
  name "Blueprint+"
  desc "Cabinet takeoffs from PDF plans"
  homepage "https://github.com/lukeadair/blueprint-plus-macos"

  depends_on macos: :tahoe

  app "Blueprint+.app"

  # shortcut: the app isn't notarized, so clear the download quarantine; drop this once it's signed with Developer ID
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Blueprint+.app"]
  end

  uninstall quit: "com.lukeadair.blueprintplus"

  zap trash: "~/Library/Containers/com.lukeadair.blueprintplus"
end
