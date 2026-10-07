class Lwc < Formula
  desc "Agent-driven proactive memory CLI for AI agents"
  homepage "https://github.com/JanYork/llm-wiki-cli"
  url "https://github.com/JanYork/llm-wiki-cli/archive/refs/tags/v0.19.4.tar.gz"
  sha256 "067f0993f3cf094e9e1d67d8b5e1d3c5bbd27698dfae828a616b636a61efe6e2"
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
