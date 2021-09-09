class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user

  def user_attributes=(user_attribute)
    if user_attribute[:username] != ""
      new_user = User.create(username: user_attribute[:username])
      self.user_id = new_user.id
    end
  end

end
