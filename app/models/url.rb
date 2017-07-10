class Url < ApplicationRecord
  def to_params
    self.new_url
  end
end
