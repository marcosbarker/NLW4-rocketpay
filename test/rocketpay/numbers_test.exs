defmodule Rocketpay.NumbersTest do
  use ExUnit.Case, async: true

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
  test "when there is a file with the given name, returns the sum of numbers" do
    response = Numbers.sum_from_file("numbers")

    expected_response = "banana"

    assert response == expected_response
  end

  test "when there is a no file with the given name, returns an error" do
    response = Numbers.sum_from_file("banana")

    expected_response = "banana"

    assert response == expected_response

  end
 end
end
