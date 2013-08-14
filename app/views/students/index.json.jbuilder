json.array!(@students) do |student|
  json.extract! student, :UID, :last_name, :first_name, :degree, :specialization, :cohort
  json.url student_url(student, format: :json)
end
