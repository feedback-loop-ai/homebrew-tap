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
  version "0.12.0" # brokkr-version
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-arm64.tar.gz"
      sha256 "e4d2aca364319128cc7de2f014ed32440bf0f47e8252c8a607932bb955870014" # brokkr-macos-arm64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-x86_64.tar.gz"
      sha256 "db1c0cfac78f3352ace5f7ff52829291ec285e1c3cf8f9f3cee4a35d19c8731c" # brokkr-macos-x86_64.tar.gz
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-aarch64.tar.gz"
      sha256 "6e1bf52dee82530a50c8c4451fb58066c9bc4b696e1cc1252d9fe4fccd72f386" # brokkr-linux-aarch64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-x86_64.tar.gz"
      sha256 "9bb3262f21cc3d36345ec89f0bffeb2feacda6157135145ffc916804f64d30e7" # brokkr-linux-x86_64.tar.gz
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
