defmodule Money.Mixfile do
  use Mix.Project

  @version "1.12.3"
  @github_url "https://github.com/elixirmoney/money"

  def project do
    [
      app: :money,
      aliases: aliases(),
      name: "Money",
      version: @version,
      elixir: "~> 1.0",
      deps: deps(),
      docs: fn ->
        [
          main: "readme",
          source_ref: "v#{@version}",
          source_url: @github_url,
          canonical: "http://hexdocs.pm/money",
          source_url: @github_url,
          extras: ["README.md", "CHANGELOG.md", "CONTRIBUTING.md", "LICENSE.md"]
        ]
      end,
      description: description(),
      package: package(),
      preferred_cli_env: [check: :test],
      dialyzer: [plt_add_apps: [:ecto, :phoenix_html, :decimal]]
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      # Soft dependencies
      {:ecto, "~> 1.0 or ~> 2.0 or ~> 2.1 or ~> 3.0", optional: true},
      {:phoenix_html, "~> 2.0 or ~> 3.0", optional: true},
      {:decimal, "~> 1.0 or ~> 2.0", optional: true},

      # Code style and analyzers
      {:credo, "~> 1.6.0", only: [:dev, :test], runtime: false, optional: true},
      {:dialyxir, "~> 1.1.0", only: [:dev, :test], runtime: false, optional: true},

      # Docs
      {:ex_doc, "~> 0.21", only: [:dev, :docs]}
    ]
  end

  defp description do
    """
    Elixir library for working with Money safer, easier, and fun, is an
    interpretation of the Fowler's Money pattern in fun.prog.
    """
  end

  defp package do
    [
      maintainers: ["Petr Stepchenko", "Giulio De Donato", "Andrew Timberlake"],
      contributors: ["Petr Stepchenko", "Giulio De Donato", "Andrew Timberlake"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "#{@github_url}/blob/master/CHANGELOG.md",
        "GitHub" => @github_url
      }
    ]
  end

  defp aliases do
    [
      check: ["format --check-formatted", "credo --strict", "test", "dialyzer"]
    ]
  end
end
