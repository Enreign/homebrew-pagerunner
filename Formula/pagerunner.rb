class Pagerunner < Formula
  desc "Chrome browser automation MCP server for AI agents"
  homepage "https://github.com/Enreign/pagerunner"
  version "0.7.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Enreign/pagerunner/releases/download/v0.7.0/pagerunner-macos-arm64"
      sha256 "a75e7a23a4c67f5905801ac816ccfdc9ef19e096c954f2575742517e05c498db"
    else
      url "https://github.com/Enreign/pagerunner/releases/download/v0.7.0/pagerunner-macos-x86_64"
      sha256 "06e7cf1d6dea767e436e4a02d2d51dfe225e6bc42e50aac60d23ac7ca66bbac3"
    end
  elsif OS.linux?
    url "https://github.com/Enreign/pagerunner/releases/download/v0.7.0/pagerunner-linux-x86_64"
    sha256 "db103e6af90c9c8b68299a9e804c79342995c79c969b68f30fd2dd450cb89f44"
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
