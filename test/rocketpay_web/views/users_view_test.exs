defmodule RocketpayWeb.UsersViewTest do
  use Rocketpay.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Marcos"
      password: "12345"
      nickname: "marcosbarker"
      email: "marcos@marcos"
      age: 31
    }

    {:ok, %User{id: user_id, account: $Accont{id: account_id}} = user} =
      Create.create_user(params)

    response = render(UsersView, "create.json", user: user)

   expected_response = %{
      message: "User created",
      user: %{
        account: %{
        balance: Decimal.new("0.00"),
        id: account_id
      },
      id: account_id
      name: "marcos"
      nickname: "marcosbarker"
    }
  }

    assert expected_response == response
  end
end
