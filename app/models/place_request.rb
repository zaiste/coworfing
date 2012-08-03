class PlaceRequest < ActiveRecord::Base
  attr_accessible :active, :body, :requested_on

  belongs_to :place
  belongs_to :booker, class_name: 'User', inverse_of: :place_requests_sent
  belongs_to :receiver, class_name: 'User', inverse_of: :place_requests_received

  delegate :name, to: :place, allow_nil: true, prefix: true # .place_name
  delegate :name, to: :booker, allow_nil: true, prefix: true # .booker_name
  delegate :name, to: :receiver, prefix: true # receiver_name
  delegate :username, to: :booker, allow_nil: true, prefix: true # .booker_username
  delegate :username, to: :receiver, prefix: true  # .booker_username

  

  symbolize :status, in: [:pending, :approved, :rejected], default: :pending, scopes: true, methods: true
  

  validates :requested_on, presence: true
  validates :body, length: { in: 5..500 }, presence: true
end
