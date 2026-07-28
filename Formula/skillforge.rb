class Skillforge < Formula
  desc "A package manager for AI skills — build, publish, and install MCP-compatible skill binaries"
  homepage "https://github.com/ZenMicro-Tech/skillforge"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-aarch64-apple-darwin"
      sha256 "4bf6d4105c7f4878b659af4a073354bf501b8a2e65d06434140d3fc10a81a46e"
    else
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-x86_64-apple-darwin"
      sha256 "665ee90b97951d5d927ba36c19c1829a92eec50ba533920bd07850eb3cf68b7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-aarch64-unknown-linux-gnu"
      sha256 "9f5004c5ce17869bf31b945fe65c5315bda3e46d12fc0b3ea3b817c3da3a9799"
    else
      url "https://github.com/ZenMicro-Tech/skillforge/releases/download/v#{version}/skillforge-x86_64-unknown-linux-gnu"
      sha256 "03bb34bb0f0afee7f958f3d313457c280c9db30c836bedc88216e2bbc37aa460"
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
