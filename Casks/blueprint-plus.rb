cask "blueprint-plus" do
  version "1.0"
  sha256 "c5ef90aaf5ccee8825d56f37708caab230491cfa1b0707765d14796b8aac482c"

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
