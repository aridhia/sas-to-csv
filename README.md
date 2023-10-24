# SAS to CSV

Script to convert SAS files to CSV files for upload into FAIR.

## Usage

* In the `sas_to_csv.r` script, update the value of `file` to the path to the SAS file that has to be converted.
* Run the script.
*  This generates two CSV files, in the same directory as the SAS file.
    * `<your_SAS_file_name>_data.csv`, containing the actual data, which can be uploaded to FAIR.
    * `<your_SAS_file_name>_metadata.csv`, containing metadata (name, label, type), which can be used to create a FAIR dictionary for the file.

## Notes

* This script is specifically written for SAS files in SDTM format.
* It can be used for both `.sas7bdat` and `.xpt` files.
* It is assumed that the names of all fields in the SAS file that contain dates end in `DTC`. These are assigned in the metadata file the type `date`.
* Fields of the type `character` in the SAS file are assigned in the metadata file the type `text`.
* Fields of the type `double` in the SAS file are assigned in the metadata file the type `decimal`.


