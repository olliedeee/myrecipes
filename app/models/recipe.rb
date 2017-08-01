class Recipe < ActiveRecord::Base
  
  belongs_to :chef
  validates :chef_id, presence:true
  
  # validate name
  validates :name, presence: true, length: {minimum: 5, maximum:100}
  
  #validate summary
  validates :summary, presence: true, length: {minimum: 10, maximum:150}


  #validate desc
  validates :description, presence: true, length: {minimum: 20, maximum:500}

end