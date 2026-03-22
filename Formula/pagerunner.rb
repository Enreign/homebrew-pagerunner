class Pagerunner < Formula
  desc "Chrome browser automation MCP server for AI agents"
  homepage "https://github.com/Enreign/pagerunner"
  version "0.1.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Enreign/pagerunner/releases/download/v0.1.1/pagerunner-macos-arm64"
      sha256 "9c79e5b9bf121a504a15daf0a280c7762da03d533dd326182ee3d10669c766f9"
    else
      url "https://github.com/Enreign/pagerunner/releases/download/v0.1.1/pagerunner-macos-x86_64"
      sha256 "c05ab8ba56495a83976d930901653e7bb98f18c2e0057503804efd849cdf3297"
    end
  elsif OS.linux?
    url "https://github.com/Enreign/pagerunner/releases/download/v0.1.1/pagerunner-linux-x86_64"
    sha256 "dba4c03ec524208aa78f67c3c43e1b381554b71803b8fa0b54c5e55ba81ce3c7"
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
