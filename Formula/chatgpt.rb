class Chatgpt < Formula
  include Language::Python::Virtualenv

  desc "OAuth-first ChatGPT CLI with tool-calling support"
  homepage "https://github.com/robinmollah/chatgpt"
  head "https://github.com/robinmollah/chatgpt.git", branch: "main"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    # Ensure runtime deps are present even if pip resolves local build metadata without deps.
    venv.pip_install %w[httpx pydantic]
    venv.pip_install_and_link buildpath
  end

  def caveats
    <<~EOS
      Uninstall:
        brew uninstall chatgpt

      Remove tap (optional):
        brew untap robinmollah/tap
    EOS
  end

  test do
    assert_match "chatgpt_agent CLI", shell_output("#{bin}/chatgpt --help")
  end
end
