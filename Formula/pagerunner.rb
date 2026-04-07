class Pagerunner < Formula
  desc "Chrome browser automation MCP server for AI agents"
  homepage "https://github.com/Enreign/pagerunner"
  version "0.8.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Enreign/pagerunner/releases/download/v0.8.0/pagerunner-macos-arm64"
      sha256 "884fbe16f09520209c342b116c3e8ff0b2b551076ceee44a0f39ef01f978d449"
    else
      url "https://github.com/Enreign/pagerunner/releases/download/v0.8.0/pagerunner-macos-x86_64"
      sha256 "d9fc84dfcc9a9d8bcffe990f8949b84a2128deb9da65904ad1223433aee16377"
    end
  elsif OS.linux?
    url "https://github.com/Enreign/pagerunner/releases/download/v0.8.0/pagerunner-linux-x86_64"
    sha256 "897d9da1452c8e69ee0928596508e83b2f248a199dbba7bb6a49b69cd237385d"
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
