defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  describe "deposite/2" do
    setup %{conn: conn} do
      params = %{
        name: "Marcos"
        password: "12345"
        nickname: "marcosbarker"
        email: "marcos@marcos"
        age: 31
      }
      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      conn - put_req_header(conn, "authorization", "")

      {:ok, conn: conn, account_id: account_id}
    end

    teste "when all params are valid, make the deposit", %{conn: conn,account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
      |> post(Routes.accounts_path(conn, :deposit, account_id, params))
      |> json_response(:ok)

    assert %{
              "account" => %{"balance" => "0.00", "id" => _id},
              "message" => "Ballance changed successfully"
            } = response
    end

    teste "when there are invalid params, returns an error", %{conn: conn,account_id: account_id} do
      params = %{"value" => "invalido"}

      response =
        conn
      |> post(Routes.accounts_path(conn, :deposit, account_id, params))
      |> json_response(:bad_request)

       expected_response = %{"message" => "Invalid deposit value!"}
       assert response == expected_response
    end
  end
end
