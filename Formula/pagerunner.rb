class Pagerunner < Formula
  desc "Chrome browser automation MCP server for AI agents"
  homepage "https://github.com/Enreign/pagerunner"
  version "0.7.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Enreign/pagerunner/releases/download/v0.7.1/pagerunner-macos-arm64"
      sha256 "eae47c538db9cff629a32fe7cd67c2b0d603161e29b2093e3a5162d27f312a5f"
    else
      url "https://github.com/Enreign/pagerunner/releases/download/v0.7.1/pagerunner-macos-x86_64"
      sha256 "49db58ae5e7584979f8106b538c3c2718ab870e81e9ad690ca82aeb78cfb84ac"
    end
  elsif OS.linux?
    url "https://github.com/Enreign/pagerunner/releases/download/v0.7.1/pagerunner-linux-x86_64"
    sha256 "aed85e325c7bd0dc51b9ffb890644f1e8e0084071551139351b726dd7441c62d"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "pagerunner-macos-arm64" => "pagerunner"
      else
        bin.install "pagerunner-macos-x86_64" => "pagerunner"
      end
    elsif OS.linux?
      bin.install "pagerunner-linux-x86_64" => "pagerunner"
    end
  end

  test do
    system "#{bin}/pagerunner", "--help"
  end
end
