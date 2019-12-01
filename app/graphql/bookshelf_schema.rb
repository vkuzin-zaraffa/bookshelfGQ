class BookshelfSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  def self.unauthorized_object(error)
    raise GraphQL::ExecutionError, "Permission configuration error"
  end
end
