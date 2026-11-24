cask "blueprint-plus" do
  version "1.0"
  sha256 "478f6c5b29d897a9dcd51756b152e46d80c97b5daafc4a977255c3dd78e9d3f0"

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
