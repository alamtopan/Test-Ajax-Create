class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/assets/" + [version_name, "default.png"].compact.join('_')
  end

  version :large do
    process :resize_to_fit => [500, 500]
  end

  version :normal do
    process :resize_to_fit => [300, 300]
  end

  version :small do
    process :resize_to_fit => [170, 170]
  end

  def extension_white_list
    %w(jpg jpeg png gif)
  end
end
