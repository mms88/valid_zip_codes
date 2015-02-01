require 'yaml'

class ValidZipCodes

	SUPPORTED_COUNTRIES = ["DK", "SE"]

	def initialize 
		load_zips
	end

	def is_valid_zip?(country, zip)
		if supports_country?(country)
			country_hash(country).select{|z| z["zip"] == zip.to_s}.count > 0
		else
			raise "Country not supported"
		end
	end

	def get_city_name(country, zip)
		if supports_country?(country)
			sr = country_hash(country).select{|z| z["zip"] == zip.to_s}
			sr.count > 0 ? sr.first["city"] : raise("Zip not found")
		else
			raise "Country not supported"
		end
	end

	def supports_country?(country)
		SUPPORTED_COUNTRIES.include?(country)
	end


	private

	def load_zips
		@zips = []
		SUPPORTED_COUNTRIES.each do |c|
			@zips << YAML::load_file(File.join(__dir__, "../zips/#{c}.yml"))
		end
	end

	def country_hash country
		@zips.each{|c| return c[country] if c.keys[0] == country}
		raise "Country not found"
	end

end
