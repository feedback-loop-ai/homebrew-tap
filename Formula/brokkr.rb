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
  version "0.15.2" # brokkr-version
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-arm64.tar.gz"
      sha256 "7b126f654f2c14f50f43b5999dc20b753d8b9f2e0d43200ee3764d1c61f88edc" # brokkr-macos-arm64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-x86_64.tar.gz"
      sha256 "213eb0e183c11df84c190041c59243b6fa8dd5264847a72fc0be1a9c821c53ab" # brokkr-macos-x86_64.tar.gz
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-aarch64.tar.gz"
      sha256 "61f87b5a8449555748dfd3788ed1a62d7e4ad070a2099664c64f01c2aa67928c" # brokkr-linux-aarch64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-x86_64.tar.gz"
      sha256 "ecce9b5acea9e07eb5b9f978b87272aa87273add34f1f215cdc400aeb2f52eb3" # brokkr-linux-x86_64.tar.gz
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
