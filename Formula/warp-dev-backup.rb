# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class WarpDevBackup < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage "https://github.com/db-it/warp-dev-backup"
  url "https://github.com/db-it/warp-dev-backup/releases/download/v0.2.0/warp_dev_backup-0.2.0.tar.gz"
  sha256 "a35e6463e762e1af0850b3f5d84ac681f62f178eaac559dabfbfe098433f6efb"
  license "GPL-3.0"

  depends_on "python"

  resource "humanize" do
    url "https://files.pythonhosted.org/packages/6a/40/64a912b9330786df25e58127194d4a5a7441f818b400b155e748a270f924/humanize-4.11.0.tar.gz"
    sha256 "e66f36020a2d5a974c504bd2555cf770621dbdbb6d82f94a6857c0b1ea2608be"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  def install
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"wdb", "scan", "--service"]
    run_type :interval
    require_root true
    interval 60 # 24 hours = 60 * 60 * 24
    log_path "~/Library/Logs/warp-dev-backup/wdb.service.stdout.log"
    error_log_path "~/Library/Logs/warp-dev-backup/wdb.service.stderr.log"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test warp-dev-backup`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
