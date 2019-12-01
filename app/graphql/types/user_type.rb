class Types::UserType < Types::BaseObject
  description 'A User'

  field :id, ID, null: false
  field :email, String, null: false
  field :is_superadmin, Boolean, null: true

end