REGISTER pig-examples.jar;

DEFINE isGood IsGoodQuality();

records = LOAD 'sample.txt' AS (year:chararray, temperature:int, quality:int);

filtered_records = FILTER records BY temperature != 9999 AND isGood(quality);

grouped_records = GROUP filtered_records BY year;

max_temp = FOREACH grouped_records GENERATE group, MAX(filtered_records.temperature);

DUMP max_temp; 
