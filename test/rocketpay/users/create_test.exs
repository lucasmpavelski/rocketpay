defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all parems are valid, returns an user" do
      params = %{
        name: "test name",
        password: "test password",
        nickname: "test nickname",
        age: 18,
        email: "test@test.com"
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "test name", age: 18, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "test name",
        password: "test password",
        nickname: "",
        age: 17,
        email: "test@test.com"
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{age: ["must be greater than or equal to 18"], nickname: ["can't be blank"]}
      assert expected_response == errors_on(changeset)
    end
  end
end
