defmodule Rocketpay.Accounts.Transactions.Response do
  alias Rocketpay.Account

  defstruct [:from_account, :to_account]

  def build(%Account{} = from_acount, %Account{} = to_account) do
    %__MODULE__{
      from_account: from_acount,
      to_account: to_account
    }
  end
end
