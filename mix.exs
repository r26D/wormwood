defmodule Wormwood.MixProject do
  use Mix.Project

  def project do
    [
      app: :wormwood,
      version: "0.2.5",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      aliases: aliases(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:absinthe, "~>1.5.0 or ~> 1.6.0 or ~> 1.7.0"},

      {:excoveralls, "~> 0.14", only: :test},
      {:ex_doc, "~> 0.28", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Wormwood is a tiny library to aid in testing GraphQL queries against an Absinthe schema.
    It allows you to test your query documents inside ExUnit test modules, and requires no HTTP requests to occur during testing.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Aaron Shea", "Tinfoil Security Inc."],
      licenses: ["MIT"],
      source_url: "https://github.com/tinfoil/wormwood",
      links: %{
        "GitHub" => "https://github.com/tinfoil/wormwood",
        "Tinfoil Website" => "https://www.tinfoilsecurity.com/go/opensource"
      }
    ]
  end

  defp aliases do
    [
      prettier: "format \"mix.exs\" \"{lib,test}/**/*.{ex,exs}\""
    ]
  end
end
