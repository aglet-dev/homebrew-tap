# frozen_string_literal: true
class Aglet < Formula
  desc "Agent-first aglet runtime CLI (dev / CI / authoring tool)"
  homepage "https://github.com/aglet-dev/aglet"
  url "https://github.com/aglet-dev/homebrew-tap/releases/download/aglet-v0.1.0/aglet-cli-0.1.0-aarch64-apple-darwin.tar.gz"
  version "0.1.0"
  sha256 "bdbc32b3ee8f62170df63c05525a85f2a84a67deb1c5c87a1733cf55358c91cc"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

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
