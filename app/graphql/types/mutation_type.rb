module Types
  class MutationType < Types::BaseObject

    ## It is possible
    #field :create_author, AuthorType, null: true, description: 'Create an author' do
    #  argument :first_name, String, required: false #, camelize: false
    #  argument :last_name, String, required: false
    #  argument :yob, Int, required: false
    #  argument :is_alive, Boolean, required: false
    #end
    #
    #def create_author(first_name:, last_name:, yob:, is_alive:)
    #  Author.create(first_name:first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    #end

    field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor
    field :update_author, Boolean, null: false, description: 'Update an Author' do
      argument :author, Types::AuthorInputType, required: true
    end

    # TODO need through Mutations::UpdateAuthor
    def update_author(author:)
      existing = Author.find(author[:id])
      existing&.update(author.to_h)
    end
  end
end
