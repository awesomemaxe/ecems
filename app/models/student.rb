class Student < ActiveRecord::Base
#before_validation :cohort_conversion
attr_accessible :UID, :last_name, :first_name, :email, :degree, :specialization,:cohort
#validates :UID, :last_name, :first_name, :email,:degree, :specialization,:cohort
validates :UID, uniqueness: true, format: {
	with: /([a-zA-Z][\d]{8})\z/i,
	message: 'This is not an valid student ID'
}
validates :email, allow_blank: true, format: {
	with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
	message: 'This is not an valid email format.'
}
=begin
	
	def cohort_conversion
		if cohort.length > 6
			year = cohort[cohort.length-4,4]
		end
			if cohort.include? "fall"
				# insert in year-09-01 (FALL start)
				temp = year.concat('-09-01')
				self.start_date = temp
				temp2 = temp.to_i+1
				degreetemp  = degree
				logger.info("degree: #{degreetemp}")
				if degree == "pm-phd-ee" or degree == "pm-phd-ce"
					logger.info("This student is pm.")
					self.must_achieve_cand_by = temp2.to_s.concat('-08-31')
				elsif degree == "pb-phd-ee" or degree == "pb-phd-ce"
					logger.info("This student is pb.")
					self.must_achieve_cand_by = temp2.to_s.concat('-12-15')
				end
			elsif cohort.include? "spr"
				# insert in year-01-15 (SPR start)
				temp = year.concat('-01-15')
				self.start_date = temp
				temp2 = temp.to_i+1
				self.must_achieve_cand_by = temp2.to_s.concat('-01-15')
			elsif cohort.include? "sum"
				# insert in year-08-15 (SUM end)

			end	
	end
=end

end