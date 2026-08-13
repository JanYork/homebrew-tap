class Lwc < Formula
  desc "Agent-driven proactive memory CLI for AI agents"
  homepage "https://github.com/JanYork/llm-wiki-cli"
  url "https://github.com/JanYork/llm-wiki-cli/archive/refs/tags/v0.14.6.tar.gz"
  sha256 "f9fad1347f68284c296eca968dfd5c4025bb3404cdf94699148efbe608937593"
  license "Apache-2.0"
  head "https://github.com/JanYork/llm-wiki-cli.git", branch: "main"

  bottle do
    root_url "https://github.com/JanYork/homebrew-tap/releases/download/lwc-0.14.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "540194e4b34d50e1276be367bb4ff25f4fffd59c22ef71057d27c03b34f9a090"
    sha256 cellar: :any,                 x86_64_linux: "47b5edfa782cb16a0cdf14a55c0dd4d25f9fb28748072f7b95f2fa1332f1e0e3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lwc --version")
    system bin/"lwc", "init"
    assert_path_exists testpath/".lwc/wiki.db"
  end
end
