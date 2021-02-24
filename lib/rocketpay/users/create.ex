defmodule Rocketpay.Users.Create do
 alias Rocketpay.{Repo, User}

 def call(params) do
  params
  |> Users.changeset()
  |> Repo.insert()
 end
end
