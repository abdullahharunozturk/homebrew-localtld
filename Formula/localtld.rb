class Localtld < Formula
  desc "Give your local projects real domains on dynamic ports"
  homepage "https://localtld.sh"
  url "https://github.com/abdullahharunozturk/localtld/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "b64818978eca77167c6da21d476c69cd166097eea972ede25a80c9fa49419703"
  license "MIT"
  version "0.1.2"

  depends_on :macos
  depends_on "caddy"
  depends_on "dnsmasq"
  depends_on "jq"

  def install
    bin.install "bin/localtld"
    pkgshare.install "share/Caddyfile.example"
  end

  def caveats
    <<~EOS
      Run first-time setup to configure dnsmasq + Caddy (asks for sudo once):
        localtld setup
    EOS
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/localtld --version")
  end
end
