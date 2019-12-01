class Types::CoordinatesType < Types::BaseObject
  field :latitude, Float, null: true
  field :longitude, Float, null: true

  def latitude
    object.first
  end
  def longitude
    object.last
  end

  def self.authorized?(obj, cnt)
    obj.first > 10 && obj.last < 10
  end
end