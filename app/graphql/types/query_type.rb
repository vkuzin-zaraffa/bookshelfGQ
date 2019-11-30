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
  end
end
