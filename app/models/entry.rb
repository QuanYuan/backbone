class Entry < ActiveRecord::Base
  attr_accessible :address, :name, :tags, :winner
  validates :name, presence: true
  validates_format_of :address, :with=>URI::regexp(%w(http https))
end
