class Member < ApplicationRecord
  class << self
    def search(query)
      # クラス内ではレシーバを省略できる
      rel = order('number')
      if query.present?
        rel = rel.where('name LIKE ? OR full_name LIKE ?', "%#{query}%", "%#{query}%")
      end
      rel
    end
  end

  def destroy
    self.deleted = true
    save
  end
end
