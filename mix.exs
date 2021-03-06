defmodule Cid.MixProject do
  use Mix.Project

  def project do
    [
      app: :excid,
      version: "0.2.0",
      package: package(),
      description: description(),
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.json": :test,
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_multihash, "~> 2.0"},
      {:jason, "~> 1.1"},
      {:b58, "~> 0.1.1"},
      {:excoveralls, "~> 0.10", only: :test},
      {:stream_data, "~> 0.4.2", only: :test},
      {:ex_doc, "~> 0.19.3", only: :dev}
    ]
  end

  defp description() do
    "cid (\"content id\") is a human-friendly (readable/typeable) unique ID function built for distributed/decentralised systems."
  end

  defp package() do
    [
      name: "excid",
      licenses: ["GNU GPL v2.0"],
      maintainers: ["dwyl"],
      links: %{"GitHub" => "https://github.com/dwyl/cid"}
    ]
  end
end
