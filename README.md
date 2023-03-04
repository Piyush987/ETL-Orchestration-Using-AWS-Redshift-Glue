# ETL-Orchestration-Using-AWS-Redshift-Glue
Overview - ETL Pipeline to load Amazon Customers Review Dataset by establishing database connection by a series of AWS Glue Python Shell Jobs to connect to AWS Redshift cluster.  
Redshift Spectrum reads data from S3 and loads it into Redshift tables and also executes aggregation queries via UNLOAD to s3.  
State Machine can send notification to AWS Simple Notofication Service(SNS) in case of pipeline failure.  
Data can be queried from the clusters using AWS Quicksight.  
