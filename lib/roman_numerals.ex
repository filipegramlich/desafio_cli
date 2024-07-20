defmodule RomanNumerals do
  @roman_numerals [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  def to_roman(number) when number > 0 do
    convert(number, @roman_numerals, "")
  end

  defp convert(0, _roman_numerals, result), do: result

  defp convert(number, [{value, roman} | tail], result) when number >= value do
    convert(number - value, [{value, roman} | tail], result <> roman)
  end

  defp convert(number, [_ | tail], result) do
    convert(number, tail, result)
  end
end
