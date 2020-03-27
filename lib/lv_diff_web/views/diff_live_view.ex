defmodule LvDiffWeb.DiffLiveView do
  use LvDiffWeb, :view

  @td_classes "border px-4 py-2 text-center"

  def render_ses( ses ) do
    Enum.map(ses, fn x -> x |> render_edit_item() end)
  end

  defp str_list_to_td_list(str_list) do
    Enum.map(str_list, fn x -> content_tag(:td, x, [class: @td_classes]) end)
  end

  defp td_list_to_tr(td_list, classes) do
    content_tag(:tr, td_list , class: classes)
  end

  defp render_tr(str_list, class) do
    str_list
    |> str_list_to_td_list()
    |> td_list_to_tr(class)
  end

  defp render_edit_item({:eq, text}) do
    render_tr(["Both", text, text], "bg-gray-100")
  end

  defp render_edit_item({:ins, text}) do
    render_tr(["Text2 only", "", text], "bg-teal-100")
  end

  defp render_edit_item({:del, text}) do
    render_tr(["Text1 only", text, ""], "bg-red-100")
  end


end