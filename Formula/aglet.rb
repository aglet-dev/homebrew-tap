# frozen_string_literal: true
class Aglet < Formula
  desc "Agent-first aglet runtime CLI (dev / CI / authoring tool)"
  homepage "https://github.com/aglet-dev/aglet"
  url "https://github.com/aglet-dev/homebrew-tap/releases/download/aglet-v0.1.4/aglet-cli-0.1.4-universal-apple-darwin.tar.gz"
  version "0.1.4"
  sha256 "7925ecfe96323e9a4ec2230b8c9554753748c59630ab8facb20b2b98c66ab5d1"
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
