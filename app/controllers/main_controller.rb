class MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home

  end

  def upload
    binding.pry
  end

  def file_lists

  end
end
