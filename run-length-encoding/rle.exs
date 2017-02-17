defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string
    |> String.codepoints
    |> Enum.chunk_by(&(&1))
    |> Enum.map(&counted_chars/1)
    |> Enum.join
  end

  defp counted_chars(list = [" " | _]) do
    Enum.join(list)
  end

  defp counted_chars(list) do
    case Enum.count(list) do
      1 -> "#{Enum.at(list, 0)}"
      n -> "#{n}#{Enum.at(list, 0)}"
    end
  end

  @spec decode(String.t) :: String.t
  def decode(""), do: ""
  def decode(string) do
    Regex.scan(~r/[0-9]*[a-zA-Z\s]/, string)
    |> List.flatten
    |> Enum.reduce("", &do_decode/2)
  end

  defp do_decode(pair, acc) do
    {number, letter} = case Integer.parse(pair) do
      {integer, binary} -> {integer, binary}
      :error -> {1, pair}
    end

    acc <> String.duplicate(letter, number)
  end
end
