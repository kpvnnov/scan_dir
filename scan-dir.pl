#!/usr/bin/perl -w
use strict;
 
my $scan_dir = ".";
 
$scan_dir = $ARGV[0] if defined $ARGV[0];
 
die "Error. Dir $scan_dir not found." unless (-e $scan_dir);
 
scan_dir ($scan_dir,"d");
 
exit 0;
 
sub scan_dir
{
 
    my ($_dir, $_mode) = @_;
    my @list;
 
    my $mode = "a";
    my $dir = ".";
    my $counter = 0;
 
    $mode = $_mode if defined $_mode;
    $dir = $_dir if defined $_dir;
    #print "$dir\n";
    for my $file (glob($dir.'/*'))
    {
 
        next if -l $file;
        if (-d $file)
        {
            scan_dir($file,$mode);
        }
        next unless -f $file;
        $counter++;
    }
   if ($counter>8000){
    print "$counter $dir\n";
   }
}