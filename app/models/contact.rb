class Contact < ActiveRecord::Base
  belongs_to :kind # contato pertence a um tipo 
  has_one :address # contato tem um endereço
  has_many :phones 
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  
  validates :name , presence: true 
  validates :email, presence: true
end
