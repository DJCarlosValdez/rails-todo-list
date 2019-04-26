class TodoItem < ApplicationRecord

    belongs_to :todo_list

    validates :content, presence: true

    def completed?
        p !completed_at.blank?
    end

end
