from redshift_module import pygresql_redshift_common as rs_common
import sys
from awsglue.utils import getResolvedOptions
import boto3

#get job args
args = getResolvedOptions(sys.argv,['db','db_creds','bucket','file'])
db = args['db']
db_creds = args['db_creds']
bucket = args['bucket']
file = args['file']

#get sql statements
s3 = boto3.client('s3') 
sqls = s3.get_object(Bucket=bucket, Key=file)['Body'].read().decode('utf-8')
sqls = sqls.split(';')

#get database connection
print('connecting...')
con = rs_common.get_connection(db,db_creds)

#run each sql statement
print("connected...running query...")
results = []
for sql in sqls[:-1]:
    sql = sql + ';'
    result = rs_common.query(con, sql)
    print(result)
    results.append(result)

print(results)

