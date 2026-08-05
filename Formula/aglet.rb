# frozen_string_literal: true
class Aglet < Formula
  desc "Agent-first aglet runtime CLI (dev / CI / authoring tool)"
  homepage "https://github.com/aglet-dev/aglet"
  url "https://github.com/aglet-dev/homebrew-tap/releases/download/aglet-v0.3.1/aglet-cli-0.3.1-universal-apple-darwin.tar.gz"
  version "0.3.1"
  sha256 "d6046dbaa17939c3b0848641eb3f5ceaccf2ec8871c75beb0775ada61d711998"
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
