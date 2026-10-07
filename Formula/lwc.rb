class Lwc < Formula
  desc "Agent-driven proactive memory CLI for AI agents"
  homepage "https://github.com/JanYork/llm-wiki-cli"
  url "https://github.com/JanYork/llm-wiki-cli/archive/refs/tags/v0.19.5.tar.gz"
  sha256 "bfe20d0c6055dec9880970d364e6971510c3125e0c08ee7d3f0b4ee77ffcb93b"
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
