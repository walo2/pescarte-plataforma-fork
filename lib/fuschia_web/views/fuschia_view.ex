defmodule FuschiaWeb.FuschiaView do
  use FuschiaWeb, :view

  @spec render(binary, map) :: map
  def render("response.json", %{data: data}) do
    %{
      data: data
    }
  end

  def render("paginated.json", %{data: data, pagination: pagination}) do
    %{
      data: data,
      pagination: pagination
    }
  end
end
