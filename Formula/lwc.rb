class Lwc < Formula
  desc "Agent-driven proactive memory CLI for AI agents"
  homepage "https://github.com/JanYork/llm-wiki-cli"
  url "https://github.com/JanYork/llm-wiki-cli/archive/refs/tags/v0.18.6.tar.gz"
  sha256 "9e8be265c07aba4a9126323f88c9fd381f38f3a8c2c0f13626b6778e669d2e04"
  license "Apache-2.0"
  head "https://github.com/JanYork/llm-wiki-cli.git", branch: "main"

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
