# Import modules
import os
import pandas as pd
import pyreadstat

# Path to SAS file to be converted
file = 'path/to/test.xpt'

base = os.path.splitext(file)[0]
extension = os.path.splitext(file)[1]

# Read in SAS file
if extension == '.sas7bdat':
    data, metadata = pyreadstat.read_sas7bdat(file)
elif extension == '.xpt':
    data, metadata = pyreadstat.read_xport(file)

# Select metadata columns
name = metadata.column_names
label = metadata.column_labels
type = list(metadata.readstat_variable_types.values())
list = zip(name, label, type)
metadata = pd.DataFrame(list, columns=('name', 'label', 'type'))
# Change type string to text and double to decimal
metadata.loc[metadata['type'] == 'string', 'type'] = 'text'
metadata.loc[metadata['type'] == 'double', 'type'] = 'decimal'
# Change type of columns all ending on "DTC" to date
# This assumes that all date columns in SDTM end on "DTC"
metadata.loc[metadata['name'].str.endswith('DTC'), 'type'] = 'date'

# Write data and metadata to CSV files
data.to_csv(base + '_data.csv', index=False)
metadata.to_csv(base + "_metadata.csv", index=False)
