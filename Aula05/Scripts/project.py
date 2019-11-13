
import csv 
import json
import operator
import collections
import matplotlib.pyplot as plt; plt.rcdefaults()
import numpy as np
import matplotlib.pyplot as plt
import time

def update_line(hl, new_data, new_data1):
    hl.set_xdata(np.append(hl.get_xdata(), new_data))
    hl.set_ydata(np.append(hl.get_ydata(), new_data1))
    



areas = {}
areasCounter = {}
areasCounterName= {}

with open('CommAreas.csv', 'r') as csvfile:
    reader2 = csv.DictReader(csvfile)
    for x in reader2:
    	#print(x["COMMUNITY"], x["AREA_NUM_1"])
    	areas[x["AREA_NUM_1"]]=x["COMMUNITY"]
    	areasCounter[x["AREA_NUM_1"]] = 0


numbers = ["01","02","03","04","05","05","06","07","08","09","10","11","12"]


for numb in numbers: 
	

	for x in areasCounter:
		areasCounter[x]=0


	with open('chicago_taxi_trips_2016_'+numb+'_good.csv', 'r') as csvfilegood:
	    reader = csv.DictReader(csvfilegood)
	    for x in reader:
	    	#print(x)
	    	if(x["pickup_community_area"] in areasCounter):

	    		areasCounter[x["pickup_community_area"]]+=1
	    		
	    	if(x["dropoff_community_area"] in areasCounter):
	    		areasCounter[x["dropoff_community_area"]]+=1
	
	for x in areasCounter:
		areasCounterName[areas[x]] = areasCounter[x]


	sorted_x = sorted(areasCounterName.items(), key=operator.itemgetter(1), reverse=True)
	graphicY = []
	graphicX = []
	for x in sorted_x:
		graphicX.append(x[0])
		graphicY.append(x[1])



	y_pos = np.arange(len(graphicY))

	fig, ax = plt.subplots()
	plt.bar(y_pos, graphicY, align='center', alpha=10)
	plt.xticks(y_pos, graphicX, rotation='vertical')
	plt.ylabel('Visits')
	plt.xlabel('Areas')
	plt.title('Visits in '+numb+"/2016")
	plt.tick_params(axis='x', which='major', labelsize=4)
	plt.tight_layout()
	hl, = plt.plot([], [])
	plt.savefig(numb+"_2016.png",dpi=200)
	#plt.show()
	print("done")








'''
# Data to insert 
areas = ('Python', 'C++', 'Java', 'Perl', 'Scala', 'Lisp')
y_pos = np.arange(len(areas))
performance = [10,8,6,4,2,1]

# Create Bar Graphic
plt.bar(y_pos, performance, align='center', alpha=0.2)
plt.xticks(y_pos, areas)

# Axis Legends
plt.ylabel('Visits')
plt.xlabel('Areas')
plt.title('muda o nome')

# Display
plt.show()

'''

