import csv 


import json

with open('column_remapping.json', 'r') as f:
    array = json.load(f)





for x in array:
	if(x == "pickup_latitude"):
		with open('pickup_latitude.csv', 'w') as csvFile:
			writer = csv.writer(csvFile)
			writer.writerows([["id","platitude"]])
			for y in array.get(x):
				writer.writerows([[y,array.get(x).get(y)]])
	if(x == "pickup_longitude"):
		with open('pickup_longitude.csv', 'w') as csvFile:
			writer = csv.writer(csvFile)
			writer.writerows([["id","plongitude"]])
			for y in array.get(x):
				writer.writerows([[y,array.get(x).get(y)]])
	if(x == "dropoff_latitude"):
		with open('dropoff_latitude.csv', 'w') as csvFile:
			writer = csv.writer(csvFile)
			writer.writerows([["id","dlatitude"]])
			for y in array.get(x):
				writer.writerows([[y,array.get(x).get(y)]])
	if(x == "dropoff_longitude"):
		with open('dropoff_longitude.csv', 'w') as csvFile:
			writer = csv.writer(csvFile)
			writer.writerows([["id","dlongitude"]])
			for y in array.get(x):
				writer.writerows([[y,array.get(x).get(y)]])							


