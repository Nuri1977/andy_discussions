json.extract! discussion, :id, :title, :content, :user_id, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
