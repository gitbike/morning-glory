class Member < ApplicationRecord
  include EmailAddressChecker

  scope :active, -> { where(deleted: false) }

  validates :number, presence: true,
                     numericality: { only_integer: true,
                                     greater_than: 0,
                                     less_than: 100,
                                     allow_blank: true },
                     uniqueness: true

  validates :name, presence: true,
                   format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true },
                   length: { minumum: 2, maximum: 20, allow_blank: true },
                   uniqueness: { case_sensitive: false }

  validates :full_name, length: { maximum: 20 }

  validate :check_email

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

private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end