class MicropostQuery
  include Queryable

  scope :today, -> { self.where(:created_at => (Date.today)..(Date.today + 23.hours + 59.minutes + 59.seconds)) }
end

