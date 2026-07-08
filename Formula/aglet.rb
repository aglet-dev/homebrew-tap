# frozen_string_literal: true
class Aglet < Formula
  desc "Agent-first aglet runtime CLI (dev / CI / authoring tool)"
  homepage "https://github.com/aglet-dev/aglet"
  url "https://github.com/aglet-dev/homebrew-tap/releases/download/aglet-v0.1.6/aglet-cli-0.1.6-universal-apple-darwin.tar.gz"
  version "0.1.6"
  sha256 "4fdba2fc0b5e970ea2208c546708fbe5fe482e6dcfd7c67373d19e26f8e5fd4c"
  license "MIT"

  depends_on :macos
  # universal binary（arm64 + Intel x86_64，apple_universal_binary 合成）→ 不限 arch。

  def install
    # Tarball has  at root; Homebrew auto-cds into the single
    # top-level dir, so we're already in . dev/test runtime is fully
    # in-proc (libaglet linked into the CLI) — no separate daemon binary.
    bin.install "aglet"
  end

  test do
    assert_match "aglet", shell_output("#{bin}/aglet --version 2>&1", 0)
  end
end
