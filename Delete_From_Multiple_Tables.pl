#!/usr/bin/perl

use strict;
use DBI;

my $hostname = 'localhost';
my $database = '<your_db>';
my $username = 'root';
my $password = '<your_pass>';

my $dbh = DBI->connect("dbi:mysql:${database}:$hostname",
  $username, $password) or die "Error: $DBI::errstr\n";

my $sth = $dbh->prepare("SHOW TABLES");
$sth->execute or die "SQL Error: $DBI::errstr\n";
my $i = 0;
my @all_tables = ();
while(my $table = $sth->fetchrow_array)
{
  $i++;
  print "table $i: $table\n";
  push @all_tables, $table;
}
my $total_table_count = $i;

print "Enter string or regex to match tables to "
  . "delete (won't delete yet): ";
my $regex = <STDIN>;
chomp $regex;

$i = 0;
my @matching_tables = ();
foreach my $table (@all_tables)
{
  if($table =~ /$regex/i)
  {
    $i++;
    print "matching table $i: $table\n";
    push @matching_tables, $table;
  }
}
my $matching_table_count = $i;
if($matching_table_count)
{
  print "$matching_table_count out of $total_table_count "
    . "tables match, and everything will be deleted from them. \n Note, only file contents will be deleted\n";
  print "Do You Want To Delete Everything From These Tables Now? [y/n] ";
  my $decision = <STDIN>;
  chomp $decision;

  $i = 0;
  if($decision =~ /y/i)
  {
    foreach my $table (@matching_tables)
    {
      $i++;
      print "deleting table $i: $table\n";
      my $sth = $dbh->prepare("delete from $table");

      $sth->execute or die "SQL Error: $DBI::errstr\n";
    }
  }
  else
  {
     print "Not Anything Deleting FROM Any Tables Because You Had None Selected.\n";
  }
}
else
{
  print "No Matching Tables To Delete From.\n";
}
