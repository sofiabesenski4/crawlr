json.extract! webpage, :id, :url, :screenshot, :created_at, :updated_at
json.url webpage_url(webpage, format: :json)
json.screenshot url_for(webpage.screenshot)
