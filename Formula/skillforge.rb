class Skillforge < Formula
  desc "A package manager for AI skills — build, publish, and install MCP-compatible skill binaries"
  homepage "https://github.com/ZenMicro-Tech/skillforge"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-aarch64-apple-darwin"
      sha256 "acb624a6de51850aa4cbc1a77bcab8c4c98f066480565816eea53861fb97d63c"
    else
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-x86_64-apple-darwin"
      sha256 "3ea0342c8a984ed908ac7d130b910be248366e639f4243f1d2c1281d53e6850a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-aarch64-unknown-linux-gnu"
      sha256 "948d800fcad18cb5cd1e0661a21204115a3fc195cfe1aff0cdd61e46caa5da1e"
    else
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-x86_64-unknown-linux-gnu"
      sha256 "c13f0faf4858b66fbab7a35dbc5733c765886a4a9d2e9f887be8392257d1e8ea"
    end
  end

  def install
    binary = Dir["skillforge-*"].first || "skillforge"
    bin.install binary => "skillforge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skillforge --version")
  end
end
