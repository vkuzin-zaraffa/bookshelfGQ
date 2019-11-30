class Mutations::UpdateAuthor < GraphQL::Schema::Mutation
  null false

  argument :author, Types::AuthorInputType, required: true

  def resolve(author:)
    existing = Author.find(author[:id])
    existing&.update(author.to_h)
  end
end