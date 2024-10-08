defmodule Identidades.Models.ContatoTest do
  use Pescarte.DataCase, async: true

  alias Pescarte.Identidades.Models.Contato

  @moduletag :unit

  test "changeset com emails e celulares adicionais" do
    attrs = %{
      email_principal: "test@example.com",
      celular_principal: "22123456789",
      emails_adicionais: ["test2@example.com", "test3@example.com"],
      celulares_adicionais: ["22987654321", "22987654322"],
      endereco: Faker.Address.street_address(true)
    }

    changeset = Contato.changeset(%Contato{}, attrs)

    assert changeset.valid?
    assert get_change(changeset, :email_principal) == "test@example.com"
    assert get_change(changeset, :celular_principal) == "22123456789"
    assert get_change(changeset, :emails_adicionais) == ["test2@example.com", "test3@example.com"]
    assert get_change(changeset, :celulares_adicionais) == ["22987654321", "22987654322"]
  end

  test "changeset com emails e celulares adicionais vazios" do
    attrs = %{
      email_principal: "test@example.com",
      celular_principal: "22123456789",
      emails_adicionais: [],
      celulares_adicionais: [],
      endereco: Faker.Address.street_address(true)
    }

    changeset = Contato.changeset(%Contato{}, attrs)

    assert changeset.valid?
    assert get_change(changeset, :email_principal) == "test@example.com"
    assert get_change(changeset, :celular_principal) == "22123456789"
    assert get_change(changeset, :emails_adicionais) == []
    assert get_change(changeset, :celulares_adicionais) == []
  end

  test "changeset com emails e celulares adicionais duplicados" do
    attrs = %{
      email_principal: "test@example.com",
      celular_principal: "22123456789",
      emails_adicionais: ["test2@example.com", "test2@example.com"],
      celulares_adicionais: ["22987654321", "22987654321"],
      endereco: Faker.Address.street_address(true)
    }

    changeset = Contato.changeset(%Contato{}, attrs)

    refute changeset.valid?
    assert Keyword.get(changeset.errors, :emails_adicionais)
    assert Keyword.get(changeset.errors, :celulares_adicionais)
  end

  test "changeset sem campos adicionais" do
    attrs = %{
      email_principal: "test@example.com",
      celular_principal: "22123456789",
      endereco: Faker.Address.street_address(true)
    }

    changeset = Contato.changeset(%Contato{}, attrs)

    assert changeset.valid?
    assert get_change(changeset, :email_principal) == "test@example.com"
    assert get_change(changeset, :celular_principal) == "22123456789"
  end
end
