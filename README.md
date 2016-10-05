# Delete_From_Multiple_Tables_MYSQL
Delete From Multiple Tables Without Deleting mysql tables in Perl
This Script Uses Mysql and DBI to connect to mysql server

#How to use the script
Just run the script, on RHEL ./Delete_From_Multiple_Tables
 
---------------THE CODE WILL DISPLAY--------------
table 1: Silverton_OCS_30100_ErrorPerOffer
table 2: Silverton_OCS_30100_Event
table 3: Silverton_OCS_30100_SuccessPerOffer
table 4: Silverton_OCS_30100_TotalPerBundle
table 5: Silverton_OCS_30100_TotalsPerOffer
table 6: Silverton_OCS_35001_BundlePerOffer
Enter string or regex to match tables to delete (won't delete yet):

----------------------------------------------------------
##Enter Regex that distiguishes tables you want to delete from
------------------------------------------------------------
After The Regex it will dispaly all the matching tables an prompt deletion
press (y/n);
if you press y it will delete all rows inside the table
