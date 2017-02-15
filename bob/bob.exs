defmodule Bob do
  def hey(input) do
    cond do
      empty?(input) -> "Fine. Be that way!"
      ask?(input) -> "Sure."
      yell?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp empty?(input) do
    String.strip(input) == ""
  end

  defp ask?(input) do
    String.ends_with?(input, "?")
  end

  defp yell?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end
end
