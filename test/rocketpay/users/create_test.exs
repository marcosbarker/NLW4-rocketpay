defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Marcos"
        password: "12345"
        nickname: "marcosbarker"
        email: "marcos@marcos"
        age: 31
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Marcos", age: 31, id: ^user_id} = user  #^ pin operator, fixa o valor
    end

    test "when there are invalid params, returns an user" do
      params = %{
        name: "Marcos"
        #password: "12345"
        nickname: "marcosbarker"
        email: "marcos@marcos"
        age: 31
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{}
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      asserte errors_on(changeset) == expected_response
    end
  end
end
