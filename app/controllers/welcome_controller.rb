class WelcomeController < ApplicationController
  def index
    flash[:notice] = "请把你的注意力用在全栈营上面。"
  end
end
