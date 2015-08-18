class Comment < ActiveRecord::Base
  belongs_to :opinion
  belongs_to :user
  belongs_to :option
end
