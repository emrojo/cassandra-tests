class Gender
  include Cequel::Record
  
  key :gender, :text
  has_many :receptions_by_gender
end