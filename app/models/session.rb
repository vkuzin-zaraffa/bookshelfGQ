class Session < ApplicationRecord

  belongs_to :user

  before_create do
    self.key = SecureRandom.hex(24)
  end
end
