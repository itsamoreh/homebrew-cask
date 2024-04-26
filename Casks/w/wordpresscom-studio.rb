cask "wordpresscom-studio" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "1560d444a3879bbd29f5ffc23d4c6f716bb58167f46c3a0c9169d1fa65f8f71c",
         intel: "c86979cb93bad357e722ccded51b3bda1f3faac8703a3c777734989940726962"

  url "https://cdn.a8c-ci.services/studio/studio-darwin-#{arch}-v#{version}.app.zip",
      verified: "developer.wordpress.com/studio/"
  name "Studio by WordPress.com"
  desc "WordPress local development environment"
  homepage "https://developer.wordpress.com/studio/"

  livecheck do
    url "https://developer.wordpress.com/studio/"
    regex(/studio-darwin-(arm64|x64)-v?(\d+(?:\.\d+)+)\.app\.zip/i)
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Studio.app"

  uninstall quit: "com.electron.studio"

  # No zap stanza required
end
