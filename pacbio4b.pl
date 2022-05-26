#!/usr/bin/perl

use POSIX ;

if ($#ARGV!=1) {
  print "usage: script.pl infile outfile\n";
  exit;
}

$infile = $ARGV[0];
$outfile = $ARGV[1];

open(INF, $infile) ;
open(OUTF, ">$outfile") ;
open(REJECTF, ">reject4.out") ;
open(SUMF, ">sum4.out") ;


print REJECTF "**** barcode reads disagree ****\n" ;

$nok=0;
$nbad=0;

for ($i=1; $i<=100; $i++) {
  $nbcreads[$i]=0;
}

$nreads=0 ;
$line = <INF> ;
chomp($line) ;
@spline = split (/,/, $line) ;
$current = $spline[0] ;
$previous = $current ;
$bc[$nreads] = $current ;
$nmuts[$nreads] = $spline[1] ;
$mut_nt[$nreads] = $spline[2] ;
$mut_aa[$nreads] = $spline[3] ;
$nreads++ ;
$ok=1;
while ($line = <INF>) {
  chomp($line) ;
  @spline = split (/,/, $line) ;
  $current = $spline[0] ;
  if ($previous ne $current) {
    if ($nreads<2) {
      $nbad++ ;
      $nbcreads[1]=$nbcreads[1]+1;
      print REJECTF "$bc[0]\,X,$nreads\n" ;
    } elsif ($nreads>1) {
      $nbcreads[$nreads]=$nbcreads[$nreads]+1;
      for ($i=0; $i<100; $i++) {
        $laa[$i] = "" ;
        $lnaa[$i] = 0 ;
        $lcodon[$i]="" ;
      }
      $ln = 0 ;
      for ($i=0; $i<$nreads; $i++) {
        @tempmuts=split(/;/, $mut_aa[$i]) ;
        @tempcodon=split(/;/, $mut_nt[$i]) ;
        if ($nmuts[$i] == 0) {
          $lnaa[0]++;
          $laa[0]=$tempmuts[0];
          $lcodon[0]=$tempcodon[0];
        } else {
          for ($k=0; $k<@tempmuts; $k++) {
            $matched=0;
            $taa = $tempmuts[$k] ;
            for ($j=1; $j<=$ln; $j++) {
              $caa = $laa[$j] ;
              if ($taa eq $caa) {
                $lnaa[$j]++ ;
                $matched=1;
              }
            }
            if ($matched==0) {
              $ln++ ;
              $laa[$ln] = $taa ;
              $lcodon[$ln] = $tempcodon[$k] ;
              $lnaa[$ln] = 1 ;
            }
          }
        }
      }
      $cutoff = floor($nreads/2) ;
      
      if ($lnaa[0] > $cutoff) {
# WT is majority
        $nok++;
        print OUTF "$bc[0],$lnaa[0]\($nreads\)\,0\,$laa[0]\,$lcodon[0]\n" ;
      } else {
        $majority=0;
        for ($i=1; $i<=$ln; $i++) {
          if ($lnaa[$i] > $cutoff) {
            $nok++ ;
            $majority=1;
            print OUTF "$bc[0],$lnaa[$i]\($nreads\)\,1,$laa[$i]\,$lcodon[$i]\,\n" ;
          }
        }
        if ($majority==0) {
          print REJECTF "$bc[0]\,X,$nreads\n" ;
          $nbad++ ;
        }
      }
    }
    $bc[$nreads] = $current ;
    $bc[0] = $current ;
    $nmuts[0] = $spline[1] ;
    $mut_nt[0] = $spline[2] ;
    $mut_aa[0] = $spline[3] ;
    $nreads=1 ;
    $previous = $current ;
    $ok=1;
  } else {
    $bc[$nreads] = $current ;
    $nmuts[$nreads] = $spline[1] ;
    $mut_nt[$nreads] = $spline[2] ;
    $mut_aa[$nreads] = $spline[3] ;
    $nreads++ ;
  }
}

print SUMF "Number OK $nok\n" ;
print SUMF "Number bad $nbad\n" ;
for ($i=1; $i<=100; $i++) {
  print SUMF "$i\,$nbcreads[$i]\n" ;
}


close(INF) ;
close(OUTF) ;
close(REJECTF) ;
close(SUMF) ;
