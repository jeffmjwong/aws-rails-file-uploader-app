class MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home

  end

  def upload
    s3 = Aws::S3::Resource.new(
      region: ENV['S3_REGION'],
      credentials: Aws::Credentials.new(ENV['ACCESS_KEY_ID'], ENV['SECRET_ACCESS_KEY'])
    )
    file = params[:upload_file].tempfile
    name = params[:upload_file].original_filename
    s3_object = s3.bucket(ENV['S3_BUCKET']).object(name)

    if s3_object.upload_file(file, acl: 'public-read')
      AnyFile.create!(
        url: "https://#{ENV['S3_BUCKET']}.s3-ap-southeast-2.amazonaws.com/#{name}",
        name: name
      )
      redirect_to main_files_path
    else
      head 422
    end
  end

  def files
    @files = AnyFile.all
  end
end
