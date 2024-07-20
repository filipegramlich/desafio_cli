defmodule DesafioCli do

  alias RomanNumerals

  def start do
    display_introduction_message()
    royal_family_names = request_royal_family_names_from_user([])
    rank_royal_family_names_with_proper_historical_numbering(royal_family_names)
    |> put_names_in_correct_order()
    |> display_ranked_royal_family_members_names()
  end

  def rank_royal_family_names_with_proper_historical_numbering(names_list) do
    names_list
    |>Enum.reduce({%{}, []}, fn name, { names_counter, royal_family_ranked_names } ->

      { updated_names_counter, times_the_name_repeated } = check_how_many_times_the_name_has_repeated(names_counter, name)
          |> update_names_counter()

      { updated_royal_family_ranked_names } =
          update_royal_family_ranked_names(name, times_the_name_repeated, royal_family_ranked_names)

      { updated_names_counter, updated_royal_family_ranked_names }
    end )
  end

  def check_how_many_times_the_name_has_repeated(names_counter, name) do
    times_the_name_repeated = Map.get(names_counter, name, 0)
    { names_counter, name, times_the_name_repeated }
  end

  def update_names_counter({ names_counter, name, times_the_name_repeated}) do
    updated_names_counter = Map.put(names_counter, name, times_the_name_repeated + 1)
    { updated_names_counter, times_the_name_repeated}
  end

  def update_royal_family_ranked_names( name, times_the_name_repeated, royal_family_ranked_names ) do
    updated_royal_family_ranked_names = [name <> " " <> RomanNumerals.to_roman(times_the_name_repeated + 1) | royal_family_ranked_names]
    {updated_royal_family_ranked_names}
  end

  def put_names_in_correct_order({_, royal_family_ranked_names}) do
    Enum.reverse(royal_family_ranked_names)
  end

  def display_ranked_royal_family_members_names(ranked_names) do
    Enum.each(ranked_names, &IO.puts/1)
  end

  def request_royal_family_names_from_user(acc) do
    case IO.read(:stdio, :line) do
      "\n" -> Enum.reverse(acc)
      name -> request_royal_family_names_from_user([String.trim(name) | acc])
    end
  end

  defp display_introduction_message() do
    IO.puts("""
    \n
    Bem-vindo à Ferramenta de Recuperação Histórica da Família Real de Cumbúquia!

    Você está prestes a ajudar a restaurar os registros perdidos dos reis e rainhas do nosso reino.
    Para isso, insira os nomes dos monarcas um por linha. Quando terminar, pressione Enter em uma linha em branco para finalizar a entrada.

    Vamos começar!

    - Made in Cumbúquia
    """)
  end
end
