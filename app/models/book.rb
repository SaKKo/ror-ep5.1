# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
  def id_and_name
    "#{self.id} #{self.name}"
  end
  def as_api_json
    json = {}
    json[:id_and_name] = self.id_and_name
    json[:id] = self.id
    json[:name] = self.name
    json
  end
end
