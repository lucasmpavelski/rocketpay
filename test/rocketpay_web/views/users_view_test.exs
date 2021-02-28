defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true
  import Phoenix.View

  alias RocketpayWeb.UsersView
  alias Rocketpay.{Account, User}

  test "renders create.json" do
    params = %{
      name: "test name",
      password: "test password",
      nickname: "test nickname",
      age: 18,
      email: "test@test.com"
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    assert %{
        message: "User created",
        user: %{
          account: %{balance: Decimal.new("0.00"), id: account_id},
          id: user_id, name: "test name", nickname: "test nickname"
        }
      } == response
  end
end
