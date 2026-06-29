# frozen_string_literal: true
class Aglet < Formula
  desc "Agent-first aglet runtime CLI (dev / CI / authoring tool)"
  homepage "https://github.com/aglet-dev/aglet"
  url "https://github.com/aglet-dev/homebrew-tap/releases/download/aglet-v0.1.1/aglet-cli-0.1.1-universal-apple-darwin.tar.gz"
  version "0.1.1"
  sha256 "5f9bd36f413a351321254380938360c89b5a6ba906b2aec5025268113fec0ed9"
  license "MIT"

  depends_on :macos
  # universal binary（arm64 + Intel x86_64，package.sh lipo 合成）→ 不限 arch。

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
