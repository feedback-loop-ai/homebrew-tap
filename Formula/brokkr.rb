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
#
# The formula installs shell completion for bash, zsh and fish: the live
# completer's registration (decision 0119 ruling 2), which the installed
# binary prints itself at install time when `COMPLETE=<shell>` is set and
# no word follows. It offers every verb, flag and fixed value the static
# `brokkr completions <shell>` script offers, and the live values too.
class Brokkr < Formula
  desc "Delivery engine that drives agent seats through a reviewable phase machine"
  homepage "https://github.com/feedback-loop-ai/brokkr"
  version "0.16.1" # brokkr-version
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-arm64.tar.gz"
      sha256 "c78ec9b70150afec2739e4d84933ba7ff4a02ea53f91fffe59226505729745f6" # brokkr-macos-arm64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-macos-x86_64.tar.gz"
      sha256 "3ffe99973be5aff989e30a1f8fb60061b3b3425347a946d0cfef21c37ef09d3e" # brokkr-macos-x86_64.tar.gz
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-aarch64.tar.gz"
      sha256 "143e023b3132eb780f3a17fda8c4d26d8634bb06fb85890928fba7ffa1672ba5" # brokkr-linux-aarch64.tar.gz
    end
    on_intel do
      url "https://github.com/feedback-loop-ai/brokkr/releases/download/v#{version}/brokkr-linux-x86_64.tar.gz"
      sha256 "9c4f6c56cf905742f1ecc3f19f2976e048b35e63e7fa23246b7bf75f7ca43b9b" # brokkr-linux-x86_64.tar.gz
    end
  end

  # Decision 0019 ruling 9: one binary, and it is `brokkr`. Its
  # completion is the live completer's registration, which names the
  # completer by the path it was run as: this keg's `bin/brokkr`.
  def install
    bin.install "brokkr"
    generate_completions_from_executable(bin/"brokkr", shell_parameter_format: :clap)
  end

  test do
    assert_match "brokkr #{version}", shell_output("#{bin}/brokkr --version")
    assert_match "#{bin}/brokkr", (bash_completion/"brokkr").read
  end
end
