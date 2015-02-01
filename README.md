## ValidZipCodes
Extremely simple ruby gem which is build to validate ZIP codes in nordic countries. So far it supports SE and DK. Please fork and extend  :-)

## Features
* Validate zip codes
* Get city name by zip code

## Usage

validator = ValidZipCodes.new

* Check if zip code is valid
validator.is_valid_zip?("DK", 8000)

* Get the city name for zip code
validator.get_city_name("DK", 8000)

* Check if gem supports country
validator.supports_country?("DK")