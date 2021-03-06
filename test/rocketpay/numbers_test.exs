defmodule Rocketpay.NumbersTest do
  use ExUnit.Case, async: true

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with the given name, returns the sum of numbers" do
      response = Numbers.sum_from_file("numbers")
      expected_repsonse = {:ok, %{result: 29}}
      assert response == expected_repsonse
    end

    test "when there is no file with the given name, returns the sum of numbers" do
      response = Numbers.sum_from_file("banana")
      expected_repsonse = {:error, "invalid file!"}
      assert response == expected_repsonse
    end
  end
end
