class Post < ApplicationRecord 
    validates :title, :sub_id, :author_id

    belongs_to :subs,
        primary_key: :id, 
        foreign_key: :sub_id, 
        class_name: :Sub

    belongs_to :author, 
        primary_key: :id, 
        foreign_key: :author_id, 
        class_name: :User

end