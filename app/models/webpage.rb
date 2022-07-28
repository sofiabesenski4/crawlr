class Webpage < ApplicationRecord
  has_one_attached :screenshot

  after_create_commit { broadcast_prepend_to "webpages" }
end
