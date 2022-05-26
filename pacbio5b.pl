#!/usr/bin/perl
#
if ($#ARGV!=1) {
  print "usage: script.pl infile outfile\n";
  exit;
}

$infile = $ARGV[0];
$outfile = $ARGV[1];

open(INF, $infile) ;
open(OUTF, ">$outfile") ;
open(REJECTF, ">reject5.out") ;
open(SUMF, ">sum5.out") ;

$nok=0;
$nbad=0;
$oldline="" ;
$oldbc="" ;
$midline="Y" ;
$midbc="X" ;
while ($newline = <INF>) {
  chomp($newline) ;
  @spline = split (/,/, $newline) ;
  $newbc=$spline[0] ;
  if ($midbc ne $oldbc and $midbc ne $newbc) {
    print OUTF "$midline\n" ;
    $nok++ ;
  } else {
    print REJECTF "$midline\n" ;
    $nbad++ ;
  }
  $oldbc=$midbc;
  $oldline=$midline;
  $midbc=$newbc;
  $midline=$newline;
}

print SUMF "ok $nok\n" ;
print SUMF "bad $nbad\n" ;

close(INF) ;
close(OUTF) ;
close(REJECTF) ;
close(SUMF) ;
