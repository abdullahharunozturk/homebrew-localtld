class Localtld < Formula
  desc "Give your local projects real domains on dynamic ports"
  homepage "https://localtld.sh"
  url "https://github.com/abdullahharunozturk/localtld/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c6ccfdfb8b0d12b2cebf3af07503e1a76c65e7faf10b0e2260074bf482ed0b49"
  license "MIT"
  version "0.1.1"

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
    assert_match "0.1.1", shell_output("#{bin}/localtld --version")
  end
end
