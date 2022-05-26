#!/usr/bin/perl

sub rc {
  my($l,$i,$nt,$rnt,$rseq,$seq);
  $seq = $_[0];
  $l = length($seq) ;
  $rseq="" ;
  for ($i=$l-1; $i>=0; $i=$i-1) {
    $nt=substr($seq,$i,1) ;
    $rnt="X";
    if ($nt eq "A") {$rnt=T} ;
    if ($nt eq "C") {$rnt=G} ;
    if ($nt eq "G") {$rnt=C} ;
    if ($nt eq "T") {$rnt=A} ;
    $rseq=$rseq . $rnt; 
  }
  $rseq ;
}

sub rev {
  my($l,$i,$let,$qual,$rqual) ;
  $qual=$_[0] ;
  $l=length($qual) ;
  $rqual="";
  for ($i=$l-1;$i>=0; $i=$i-1) {
    $let = substr($qual,$i,1);
    $rqual=$rqual . $let ;
  }
  $rqual ;
}

if ($#ARGV!=1) {
  print "usage: script.pl infile outfile\n";
  exit;
}

$infile = $ARGV[0];
$outfile = $ARGV[1];

open(INF, $infile) ;
open(OUTF, ">$outfile") ;
open(REJECTF, ">reject2.out") ;
open(SUMF, ">sum2.out") ;


#read in sequence and quality lines from input file

print REJECTF "**** BamHI or AscI missing rejected ****\n" ;

$nreg=0;
$ninv=0;
$nrej=0;

$search = "GGATCC" ;
$search2 = "GCGGCCGC" ;

while ($line = <INF>) {
  chomp($line) ;
  $seq=$line ;
  $line = <INF> ;
  chomp($line) ;
  $qual = $line ;
  $loc = index($seq,$search) ;
  $loc2 = index($seq,$search2) ;
  if ($loc > 0 and $loc2 > 0) {
    if ($loc > $loc2) {
      $rseq = &rc($seq) ;
      $ninv++ ;
      print OUTF "$rseq\n" ;
    } else {
      $nreg++ ;
      print OUTF "$seq\n" ;
    }
  } else {
    $nrej++ ;
    print REJECTF "$seq\n" ;
    print REJECTF "$loc\,$loc2\n" ;
  }
}

print SUMF "Regular $nreg\n" ;
print SUMF "Inverted $ninv\n" ;
print SUMF "Rejected $nrej\n" ;

close(INF) ;
close(OUTF) ;
close(REJECTF) ;
close(SUMF)
