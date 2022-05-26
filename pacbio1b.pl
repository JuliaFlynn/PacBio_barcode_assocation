#!/usr/bin/perl
#
use POSIX ;

if ($#ARGV!=2) {
  print "usage: script.pl infile outfile qavgcut\n";
  exit;
}

$infile = $ARGV[0];
$outfile = $ARGV[1];
$qavgcut = $ARGV[2];

open(INF, $infile) ;
open(OUTF, ">$outfile") ;
open(REJECTF, ">reject1.out") ;
open(SUMF, ">sum1.out") ;


#read in sequence and quality lines from input file

print REJECTF "**** quality rejected ****\n" ;

for ($k=1; $k<100; $k++) {
  $nphred[$k] = 0 ;
}

while ($line = <INF>) {
  $nseq++ ;
  $line = <INF> ;
  chomp($line) ;
  $seq=$line ;
  $line = <INF> ;
  $line = <INF> ;
  chomp($line) ;
  $qual = $line ;
  $qmin=101;
  $qcheck = 1 ;
#check quality score
  $qsum=0;
  for ($j=0; $j<length($qual); $j++) {
    $char = substr($qual,$j,1) ;
    $q=ord($char)-33 ;
    $qsum=$qsum+$q;
    #    print "$q\n" ;
    if ($q<$qmin) {
      $qmin=$q ;
    }
#    if( $q<$qcut ) {
#      $qcheck=0 ;
#    }
  }
  $qavg = $qsum / length($qual);
  if ($qavg<$qavgcut) {$qcheck=0} ;
  $iq = floor($qavg) ; 
  $nphred[$iq]++ ;
  if($qcheck==1) {
    print OUTF "$seq\n" ;
    print OUTF "$qual\n" ;
  } else {
    print REJECTF "$seq\n" ;
    print REJECTF "$qual\n" ;
  }
}

for ($k=1; $k<100; $k++) {
  print SUMF "PHRED $k\, count $nphred[$k]\n" ;
}

close(INF) ;
close(OUTF) ;
close(REJECTF) ;
close(SUMF)
