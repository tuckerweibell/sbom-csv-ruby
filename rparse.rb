require 'json'
require 'csv'

file = File.read("results.json")
hash = JSON.parse(file)
packages = hash["packages"]

headers = ["Name", "Version", "License Declared", "License Concluded" "Copyright Text", "Source"]
CSV.open("licenses.csv", "w") do |csv|
csv << headers
	packages.each do |p|
		csv << [p["name"],p["versionInfo"],p["licenseDeclared"],p["licenseConcluded"],p["copyrightText"],p["sourceInfo"]]
	end
end
