json.array!(@msstudents) do |msstudent|
  json.extract! student, :UID, :last_name, :first_name, :degree, :specialization, :cohort, :email
  json.url msstudent_url(msstudent, format: :json)
end
