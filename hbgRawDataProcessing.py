## hbg Raw Data Processing
## start over on cleaning up
## hbg time series data
## Nov 29 2012

import numpy as np
import pandas as pd
from dateutil.parser import parse
from datetime import datetime 

path = "All_Hayden_Data_R2/All_Hayden_Data_R2.csv"
hbg = pd.read_table(path, sep=",", header=11, skiprows=11, index_col="Index")
# nrows option for read table will let you read in part of the file only

hbg['Dates'] = [datetime.strptime(x, '%m/%d/%Y') for x in hbg['Date']]
hbg['Time'] = [datetime.strptime(x, '%H:%M:%S) for x in hbg['Time']]
hbg['Timestamp'] = [datetime.strptime(t, "%m/%d/%Y %H:%M") for t in hbg['Timestamp']]
hbg.set_index('Timestamp', inplace=True) #need to convert Timestamp to a datetime first



# i/o with the base package
datafile = open(path)
data = []
for row in datafile:
    data.append(row.strip().split(","))

""" split: removes whitespace (or other characters, if an input is specified). 
this section opens a file (datafile) creating a python file object
here, file is in read only mode
then, create a list called data
then iterate across open file rows, I guess python knows about rows in files
strip away the white space
split each row into element by comma
this produces a nested list: hier level of list has one element per row
within each row, there is one element for each comma
"""

# i/o with numpy
data2 = np.genfromtxt(path, delimiter=",", skip_header=11, names=True)
# couldn't get it to work. Said wrong number of columsn. probly file issue
