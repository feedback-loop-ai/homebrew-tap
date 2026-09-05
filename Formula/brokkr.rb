# TEMPLATE — not a published formula.
#
# The `sha256` values below are placeholders (sixty-four zeros). The
# release workflow renders this file from the release's own attested
# `SHA256SUMS` (`bash packaging/bump-from-sums.sh`) and opens a pull
# request against the tap repository with the rendered copy. A formula
# with placeholder digests installs nothing: that is the point — it
# cannot be published by accident.
#
# Tap: feedback-loop-ai/homebrew-tap, file Formula/brokkr.rb.
class Brokkr < Formula
  desc "Delivery engine that drives agent seats through a reviewable phase machine"
  homepage "https://github.com/feedback-loop-ai/brokkr"
  version "0.9.1" # brokkr-version
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-arm64.tar.gz"
      sha256 "77c163dc7cadbdd9cbf0fa93ec9e66623198218ca7814ee406698dfd7a840f15" # brokkr-macos-arm64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-x86_64.tar.gz"
      sha256 "de726d381a0e4d352bda485e2aa93ddb6912dd705b3273860a046e344fb83a85" # brokkr-macos-x86_64.tar.gz
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-aarch64.tar.gz"
      sha256 "816fb8e5b676e32897db69d4e75995e5f342fa5ef37e8e5487b40a801f7f88d8" # brokkr-linux-aarch64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-x86_64.tar.gz"
      sha256 "5fd8e39c964208b12da6100b02914315887be3089235d136b2ce6fee38c3b0ce" # brokkr-linux-x86_64.tar.gz
    end
  end

  # Decision 0019 ruling 9: one binary, and it is `brokkr`.
  def install
    bin.install "brokkr"
  end

  test do
    assert_match "brokkr #{version}", shell_output("#{bin}/brokkr --version")
  end
end
