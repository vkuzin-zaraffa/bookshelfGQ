module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :author, Types::AuthorType, null: true, description: "One author"do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.where(id: id).first
    end

    field :authors, [Types::AuthorType], null: false

    def authors
      Author.all
    end

    field :login, String, null: true, description: "Login user" do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if (user = User.find_by_email(email)&.authenticate(password))
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true, description: "The current logged in user"

    def current_user
      context[:current_user]
    end
  end
end
