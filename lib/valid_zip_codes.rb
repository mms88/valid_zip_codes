require 'yaml'

class ValidZipCodes

	SUPPORTED_COUNTRIES = ["DK", "SE", "FO", "GL"]

	# Constructor
	def initialize load_all = false
		if load_all
			load_all_countries 
		else
			@zips = []
		end
	end

	# Check if zip is valid 
	def is_valid_zip?(country, zip)
		
		if supports_country?(country)
			# Load country if not already loaded
			load_country(country) if !country_loaded?(country)

			# Query for zip
			country_hash(country).select{|z| z["zip"] == zip.to_s}.count > 0
		else
			raise "Country not supported"
		end

	end

	# Get city name by zip
	def get_city_name(country, zip)

		if supports_country?(country)
			# Load country if not already loaded
			load_country(country) if !country_loaded?(country)

			# Query for zip
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

	def country_loaded?(country)
		@zips.each{|c| return true if c.keys[0] == country}
		false
	end

	def load_country(country)
		@zips << YAML::load_file(File.join(__dir__, "../zips/#{country}.yml")) if supports_country?(country)
	end

	def load_all_countries
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
