# SAS to CSV

Scripts to convert SAS files to data and metadata files in CSV format for upload into [Aridhia DRE FAIR Data Services](https://www.aridhia.com/fair-data-services/).

## Important

* These scripts are specifically written for SAS files in [SDTM](https://www.cdisc.org/standards/foundational/sdtm) format.
* They can be used for both `.sas7bdat` and `.xpt` files.
* It is assumed that the names of all fields in the SAS file that contain dates end in `"DTC"`. These are assigned the type `date` in the metadata file.
* Fields of the type `character` in the SAS file are assigned the type `text` in the metadata file.
* Fields of the type `double` in the SAS file are assigned the type `decimal` in the metadata file.

## Usage

###  R

* It is assumed that R has been installed.
* To install the required R packages, run the `requirements.r` script.
* In the `sas_to_csv.r` script, update the value of `file` to the path to the SAS file that has to be converted.
* Run the `sas_to_csv.r` script.
*  This generates two CSV files, in the same directory as the SAS file.
    * `<your_SAS_file_name>_data.csv`, containing the actual data, which can be uploaded to FAIR.
    * `<your_SAS_file_name>_metadata.csv`, containing metadata (name, label, type), which can be used to create a FAIR dictionary for the data file.

###  Python

* It is assumed that Python has been installed.
* To install the required R packages, run the `requirements.txt` script:
    ```
    pip install -r requirements.txt
    ```
* In the `sas_to_csv.py` script, update the value of `file` to the path to the SAS file that has to be converted.
* Run the `sas_to_csv.py` script.
*  This generates two CSV files, in the same directory as the SAS file.
    * `<your_SAS_file_name>_data.csv`, containing the actual data, which can be uploaded to FAIR.
    * `<your_SAS_file_name>_metadata.csv`, containing metadata (name, label, type), which can be used to create a FAIR dictionary for the data file.