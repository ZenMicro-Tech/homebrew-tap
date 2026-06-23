class Skillforge < Formula
  desc "A package manager for AI skills — build, publish, and install MCP-compatible skill binaries"
  homepage "https://github.com/ZenMicro-Tech/skillforge"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-aarch64-apple-darwin"
      sha256 "01a8da40a4d8b105aef97c20c4b31b2d687dbc5ecf9d5e63c3289a08be779aae"
    else
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-x86_64-apple-darwin"
      sha256 "b7e4ff6d80c6ee1541cb32b50204a36acde9171ffdfd1f6f833db3ce28137a7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-aarch64-unknown-linux-gnu"
      sha256 "a3dfb3d907b590a8ef6385f52c04e31aa9a2912bb465d57b395db42f5ccaabde"
    else
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-x86_64-unknown-linux-gnu"
      sha256 "7c52dfa23984106423a558f3709de132f03f9a3c885624d9743e0b6a3389ff4e"
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
