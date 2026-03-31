class Pagerunner < Formula
  desc "Chrome browser automation MCP server for AI agents"
  homepage "https://github.com/Enreign/pagerunner"
  version "0.6.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Enreign/pagerunner/releases/download/v0.6.1/pagerunner-macos-arm64"
      sha256 "4d80c3adbc01debc6549ff536568eea02bb24c87c3c3b148991ee4d860c43691"
    else
      url "https://github.com/Enreign/pagerunner/releases/download/v0.6.1/pagerunner-macos-x86_64"
      sha256 "891da766204782106ef4baa264747c2246e71ad1ebef62101517b7a3c1d63b96"
    end
  elsif OS.linux?
    url "https://github.com/Enreign/pagerunner/releases/download/v0.6.1/pagerunner-linux-x86_64"
    sha256 "a7dca51f44857446a35252ef7c8550a6f5547d0cc7252f0d59bd61c4507f8397"
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
