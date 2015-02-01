require_relative "../lib/valid_zip_codes"

describe "ValidZipCodes" do

	before(:each) do 
		@validator = ValidZipCodes.new
	end

	context "is_valid_zip" do

		it "should return true on valid zip in DK" do 
			expect(@validator.is_valid_zip?("DK", 8600)).to be(true)
		end

		it "should return true on valid zip in FO" do 
			expect(@validator.is_valid_zip?("FO", 100)).to be(true)
		end

		it "should return true on valid zip in FO" do 
			expect(@validator.is_valid_zip?("GL", 3905)).to be(true)
		end

		it "should throw exception if country not supported" do 
			expect{@validator.is_valid_zip?("US", 8000)}.to raise_error
		end

		it "should return true on valid zip in SE" do 
			expect(@validator.is_valid_zip?("SE", 18622)).to be(true)
		end	
	end

	context "get_city_name" do 

		it "should return correct city name for city in DK" do 
			expect(@validator.get_city_name("DK", 8000)).to eq("Aarhus C")
		end

		it "should throw exception if country not supported" do 
			expect{@validator.get_city_name("US", 8000)}.to raise_error
		end

		it "should return correct city name for city in SE" do 
			expect(@validator.get_city_name("SE", 18622)).to eq("Vallentuna")
		end

	end

	context "supports_country" do 

		it "should return true for supported countries" do 
			expect(@validator.supports_country?("DK")).to be(true)
			expect(@validator.supports_country?("SE")).to be(true)
		end

		it "should return false for unsupported countries" do 	
			expect(@validator.supports_country?("US")).to be(false)
		end
	
	end


end
