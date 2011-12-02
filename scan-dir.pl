#!/usr/bin/perl -w
use strict;
 
my $scan_dir = ".";
 
$scan_dir = $ARGV[0] if defined $ARGV[0];
 
die "Error. Dir $scan_dir not found." unless (-e $scan_dir);
 
&scan_dir($scan_dir);
 
exit 0;
 
sub scan_dir
{
    sleep .2; 
 
    my $dir = ".";
    my $counter = 0; 
    my $ceil = 0;
 
    $dir = $_[0] if defined $_[0];
    #print "$dir\n";
    for my $file (glob($dir.'/*'))
    {
        next if -l $file;
        if (-d $file)
        {
            &scan_dir($file);
        }
        $counter++;
	$ceil = $counter/10000;
	sleep .2 if (int $ceil == $ceil);
    }
    if ($counter>8000){
        print "$counter $dir\n";
    }
}
