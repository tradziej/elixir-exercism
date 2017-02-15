defmodule Raindrops do
  @factors [3, 5, 7]
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    @factors
    |> Enum.filter(&(rem(number, &1) == 0))
    |> Enum.map(&speak/1)
    |> raindrop_speak(number)
  end

  defp speak(3), do: "Pling"
  defp speak(5), do: "Plang"
  defp speak(7), do: "Plong"
  defp speak(_), do: nil

  defp raindrop_speak([], number), do: number |> Integer.to_string
  defp raindrop_speak(words, number), do: words |> Enum.join
end
