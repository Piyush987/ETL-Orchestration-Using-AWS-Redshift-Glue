CREATE EXTERNAL SCHEMA amzreviews 
from data catalog
database 'amzreviews'
iam_role 'arn:aws:iam::983491514089:role/myproject_redshiftrole'
CREATE EXTERNAL database IF NOT EXISTS;



CREATE EXTERNAL TABLE amzreviews.reviews(
  marketplace varchar(10), 
  customer_id varchar(15), 
  review_id varchar(15), 
  product_id varchar(25), 
  product_parent varchar(15), 
  product_title varchar(50), 
  star_rating int, 
  helpful_votes int, 
  total_votes int, 
  vine varchar(5), 
  verified_purchase varchar(5), 
  review_headline varchar(25), 
  review_body varchar(1024), 
  review_date date, 
  year int)
PARTITIONED BY ( 
  product_category varchar(25))
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://amazon-reviews-pds/parquet/';
  
  
  
ALTER TABLE amzreviews.reviews ADD
partition(product_category='Apparel') 
location 's3://amazon-reviews-pds/parquet/product_category=Apparel/'
partition(product_category='Automotive') 
location 's3://amazon-reviews-pds/parquet/product_category=Automotive'
partition(product_category='Baby') 
location 's3://amazon-reviews-pds/parquet/product_category=Baby'
partition(product_category='Beauty') 
location 's3://amazon-reviews-pds/parquet/product_category=Beauty'
partition(product_category='Books') 
location 's3://amazon-reviews-pds/parquet/product_category=Books'
partition(product_category='Camera') 
location 's3://amazon-reviews-pds/parquet/product_category=Camera'
partition(product_category='Grocery') 
location 's3://amazon-reviews-pds/parquet/product_category=Grocery'
partition(product_category='Furniture') 
location 's3://amazon-reviews-pds/parquet/product_category=Furniture'
partition(product_category='Watches') 
location 's3://amazon-reviews-pds/parquet/product_category=Watches'
partition(product_category='Lawn_and_Garden') 
location 's3://amazon-reviews-pds/parquet/product_category=Lawn_and_Garden';


CREATE TABLE reviews(
  marketplace varchar(10),
  customer_id varchar(15), 
  review_id varchar(15), 
  product_id varchar(25) DISTKEY, 
  product_parent varchar(15), 
  product_title varchar(50), 
  star_rating int, 
  helpful_votes int, 
  total_votes int, 
  vine varchar(5), 
  verified_purchase varchar(5), 
  review_date date, 
  year int,
  product_category varchar(25))
  
  SORTKEY (
     review_date
    );
