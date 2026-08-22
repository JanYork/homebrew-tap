class Lwc < Formula
  desc "Agent-driven proactive memory CLI for AI agents"
  homepage "https://github.com/JanYork/llm-wiki-cli"
  url "https://github.com/JanYork/llm-wiki-cli/archive/refs/tags/v0.16.2.tar.gz"
  sha256 "fe7e7a0876b2abe3e63a98115a0050baebf3fd2933bf91e781df912bc7c2b52e"
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
