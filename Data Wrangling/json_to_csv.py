import csv
import json
import pathlib
import pandas as pd
import os

"""
This script convert .json file to .csv using Pandas
Input: All .json files in current directory
Output: .csv converted files to current directory
"""

# list all files in the directory

json_filenames = [' ']

for i in os.listdir():
    if i.endswith(".json"):
        json_filenames.append(i)

print("The following json files will be processed: {}".format(json_filenames))

# read json file with Pandas
def convert_json_to_csv(json_filenames = json_filenames):
    for file in json_filenames:
        df = pd.read_json(file, lines = True)
        df.to_csv(file.split('.')[0] + ".csv", index = False)

if __name__ == "__main__":
    convert_json_to_csv()
