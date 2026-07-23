# frozen_string_literal: true
class Aglet < Formula
  desc "Agent-first aglet runtime CLI (dev / CI / authoring tool)"
  homepage "https://github.com/aglet-dev/aglet"
  url "https://github.com/aglet-dev/homebrew-tap/releases/download/aglet-v0.1.8/aglet-cli-0.1.8-universal-apple-darwin.tar.gz"
  version "0.1.8"
  sha256 "fe82ca6a3f9bab404a3d554d17ee06dd6597e8f01de34a441012117238e76d95"
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
