cask "blueprint-plus" do
  version "1.1"
  sha256 "303a48bec2c9b38abd483198f0abc1aefe7351bfa6af4c6bb1f4980f20e779b5"

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
