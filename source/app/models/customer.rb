class Customer < ActiveRecord::Base
  has_many :charges

  def complete_name
    last_name + ', ' + first_name
  end
end
