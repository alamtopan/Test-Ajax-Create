class Product < ActiveRecord::Base
  scope :latest, ->{order(created_at: :desc)}
  has_many :images
  accepts_nested_attributes_for :images

  after_initialize :populate_images

  private
    def populate_images
      if self.images.length < 3
        [
          '1',
          '2',
          '3',
        ].each_with_index do |media_title, index|
          self.images.build
        end
      end if self.new_record?
    end
end
