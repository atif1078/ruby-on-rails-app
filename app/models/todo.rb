class Todo < ApplicationRecord
    enum status: { active: 0, complete: 1 }
end
