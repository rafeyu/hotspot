class Hotspot < ActiveRecord::Base
	validates :user, :price, :debt, :presence => true
	validates :price, :debt, :numericality => { :only_integer => true }
end
