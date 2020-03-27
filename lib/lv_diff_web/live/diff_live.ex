defmodule LvDiffWeb.DiffLive do
  use Phoenix.LiveView

  def render(assign) do
    Phoenix.View.render(LvDiffWeb.DiffLiveView, "index.html", assign)
  end

  def mount(_arg1, _arg2, socket) do
    text1 = "今日は暑いですね"
    text2 = "今日は寒かったですね。"
    {:ok, assign(socket, ses: [], text1: text1, text2: text2)}
  end

  def handle_event("calc_diff", %{"calc_diff" => %{"text1" => text1, "text2"=> text2}}, socket) do
    {:noreply, assign(socket, ses: String.myers_difference(text1, text2), text1: text1, text2: text2) }
  end

end