mkdir raw transformed gold 

url="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
# DOWNLOADING DATA
curl -o ./raw/data.csv $url

echo "downloading dataset"

#Check for file existence
test -f ./raw/data.csv && echo "File EXIST! " || echo "DOES NOT EXIST!"

#RENAMING COLUMN
sed -i 's/Variable_code/variable_code/g' ./raw/data.csv

# Cut the required part and save to 2023_year_finance
cut -d',' -f1,5,6,9 ./raw/data.csv > ./transformed/2023_year_finance.csv

#Check if the transformed file exists
if [ -f transformed/2023_year_finance.csv ]; then
     echo "2023_year_finance.csv exists in transformed directory."
else 
     echo "2023_year_finance.csv does not exist in the transformed directory."
fi    

#Moving transformed data into Gold directory
mv ./transformed/2023_year_finance.csv  ./gold

#checking for the moved data in gold directory

if [ -f gold/2023_year_finance.csv ]; then
     echo "2023_year_finance.csv moved to gold directory sucessfully."
else 
     echo "2023_year_finance.csv moving to gold was unsucessful."
fi    
