# frozen_string_literal: true
class Api::NewsController < ApplicationController
  def show
    @news = News.mobile
    render json: { error: false, content: { news: @news } }
  end
end
