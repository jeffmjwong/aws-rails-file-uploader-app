class MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home

  end

  def upload
    binding.pry
  end

  def files
    @files = AnyFile.all
  end
end
