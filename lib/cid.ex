defmodule Cid do
  @moduledoc """
  Returns a SHA512 transformed to Base64, remove ambiguous chars then sub-string
  """

  @doc """
  make/2 create a SHA512 hash from the given input and return the require length
  note: we remove "ambiguous" characters so _humans_ can type the hash without
  getting "confused" this might not be required, but is to match the original
  "Hits" implementation.

  ## Parameters

  - input: String the string to be hashed.
  - length: Number the length of string required

  Returns String hash of desired length.
  """
  def make(input) when is_map(input) do
    input |> stringify_map_values |> make
  end

  def make(input, length \\ 32) do
    # dogma requires this extra line ... =(
    hash = :crypto.hash(:sha512, input)
    # so alpha numeric characters with UPPERCASE, lowercase and 0-9
    # "ambiguous" chars are removed:
    hash
    |> Base.encode64()
    |> String.replace(~r/[Il0oO=\/\+]/, "", global: true)
    |> String.slice(0..(length - 1))
    # |> String.length()
  end

  def stringify_map_values(input_map) do
    Enum.sort(Map.keys(input_map)) # sort map keys for consistent ordering
    |> Enum.map(fn (x) -> Map.get(input_map, x) end)
    |> Enum.join("")
  end
end