class HasTagQuestion < ApplicationRecord
  belongs_to :tag
  belongs_to :question
end
