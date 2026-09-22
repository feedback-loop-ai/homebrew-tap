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
  version "0.11.0" # brokkr-version
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-arm64.tar.gz"
      sha256 "26c1cd3fed37fc1be2e1464d4fda2cfc47385891593deeaefdbcb45fda9146af" # brokkr-macos-arm64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-x86_64.tar.gz"
      sha256 "8a5a621caf92c62f9708c3118e2047afbb7f7777d9df12836d95233fd8a5d481" # brokkr-macos-x86_64.tar.gz
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-aarch64.tar.gz"
      sha256 "1706fb9602163dc4c5d595189aec7d2aac31b9a14577159d2a89e86c6a3f89d3" # brokkr-linux-aarch64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-x86_64.tar.gz"
      sha256 "61c8eb7f396db3c06c347877a105fac645435f8f100e3724fb2b728e29a53752" # brokkr-linux-x86_64.tar.gz
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
