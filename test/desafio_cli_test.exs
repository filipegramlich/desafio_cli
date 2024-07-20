defmodule DesafioCliTest do

  use ExUnit.Case
  doctest DesafioCli

  describe "DesafioCli.rank_royal_family_names_with_proper_historical_numbering/1" do
    test "rank received royal family names with proper historical numbering" do

      names_list = ["Filipe", "Filipe", "Max", "Filipe"]
      expected_output = ["Filipe I", "Filipe II", "Max I", "Filipe III"]

      ranked_names = DesafioCli.rank_royal_family_names_with_proper_historical_numbering(names_list)
      |> DesafioCli.put_names_in_correct_order()

      assert ranked_names == expected_output
    end
  end

  describe "DesafioCli.check_how_many_times_the_name_has_repeated/2" do
    test "check how many times a given name has been repeated before" do

      names_counter = %{"Filipe" => 1}
      name = "Filipe"
      expected_output = {%{"Filipe" => 1}, "Filipe", 1}

      result = DesafioCli.check_how_many_times_the_name_has_repeated(names_counter, name)
      assert result == expected_output
    end
  end

  describe "DesafioCli.update_names_counter/1" do
    test "update the name repetition counter correctly" do
      input = {%{"Max" => 1}, "Max", 1}
      expected_output = {%{"Max" => 2}, 1}

      result = DesafioCli.update_names_counter(input)
      assert result == expected_output
    end
  end

  describe "DesafioCli.update_royal_family_ranked_names/3" do
    test "updates the royal family members ranked names correctly" do
      name = "Filipe"
      times_name_appeared = 1
      royal_family_ranked_names = ["Max I"]
      expected_output = {["Filipe II", "Max I"]}

      result = DesafioCli.update_royal_family_ranked_names(name, times_name_appeared, royal_family_ranked_names)
      assert result == expected_output
    end
  end
end
