# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class WarpDevBackup < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage "https://github.com/db-it/warp-dev-backup"
  url "https://github.com/db-it/warp-dev-backup/releases/download/v0.1.0/warp_dev_backup-0.1.0.tar.gz"
  sha256 "82ab540b7cc0befdcfd41030dbb9b18e7958779b841073330bf56b3f6ebe45d3"
  license "GPL-3.0"

  depends_on "python"

  resource "humanize" do
    url "https://files.pythonhosted.org/packages/76/21/7a0b24fae849562397efd79da58e62437243ae0fd0f6c09c6bc26225b75c/humanize-4.9.0.tar.gz"
    sha256 "582a265c931c683a7e9b8ed9559089dea7edcf6cc95be39a3cbc2c5d5ac2bcfa"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  def install
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"wdb", "scan"]
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
