class Chatgpt < Formula
  include Language::Python::Virtualenv

  desc "OAuth-first ChatGPT CLI with tool-calling support"
  homepage "https://github.com/robinmollah/chatgpt"
  head "https://github.com/robinmollah/chatgpt.git", branch: "main"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "chatgpt_agent CLI", shell_output("#{bin}/chatgpt --help")
  end
end
