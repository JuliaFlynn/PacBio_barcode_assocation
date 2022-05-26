#!/usr/bin/perl

use POSIX;

sub codontoaa {
  my($q,$aa,$codon) ;
  $codon = lc($_[0]) ;
  $codon = substr($codon,0,3) ;
  if ($codon eq "aaa") {$aa = "K"} ;
  if ($codon eq "aac") {$aa = "N"} ;
  if ($codon eq "aag") {$aa = "K"} ;
  if ($codon eq "aat") {$aa = "N"} ;
  if ($codon eq "aca") {$aa = "T"} ;
  if ($codon eq "acc") {$aa = "T"} ;
  if ($codon eq "acg") {$aa = "T"} ;
  if ($codon eq "act") {$aa = "T"} ;
  if ($codon eq "aga") {$aa = "R"} ;
  if ($codon eq "agc") {$aa = "S"} ;
  if ($codon eq "agg") {$aa = "R"} ;
  if ($codon eq "agt") {$aa = "S"} ;
  if ($codon eq "ata") {$aa = "I"} ;
  if ($codon eq "atc") {$aa = "I"} ;
  if ($codon eq "atg") {$aa = "M"} ;
  if ($codon eq "att") {$aa = "I"} ;
  if ($codon eq "caa") {$aa = "Q"} ;
  if ($codon eq "cac") {$aa = "H"} ;
  if ($codon eq "cag") {$aa = "Q"} ;
  if ($codon eq "cat") {$aa = "H"} ;
  if ($codon eq "cca") {$aa = "P"} ;
  if ($codon eq "ccc") {$aa = "P"} ;
  if ($codon eq "ccg") {$aa = "P"} ;
  if ($codon eq "cct") {$aa = "P"} ;
  if ($codon eq "cga") {$aa = "R"} ;
  if ($codon eq "cgc") {$aa = "R"} ;
  if ($codon eq "cgg") {$aa = "R"} ;
  if ($codon eq "cgt") {$aa = "R"} ;
  if ($codon eq "cta") {$aa = "L"} ;
  if ($codon eq "ctc") {$aa = "L"} ;
  if ($codon eq "ctg") {$aa = "L"} ;
  if ($codon eq "ctt") {$aa = "L"} ;
  if ($codon eq "gaa") {$aa = "E"} ;
  if ($codon eq "gac") {$aa = "D"} ;
  if ($codon eq "gag") {$aa = "E"} ;
  if ($codon eq "gat") {$aa = "D"} ;
  if ($codon eq "gca") {$aa = "A"} ;
  if ($codon eq "gcc") {$aa = "A"} ;
  if ($codon eq "gcg") {$aa = "A"} ;
  if ($codon eq "gct") {$aa = "A"} ;
  if ($codon eq "gga") {$aa = "G"} ;
  if ($codon eq "ggc") {$aa = "G"} ;
  if ($codon eq "ggg") {$aa = "G"} ;
  if ($codon eq "ggt") {$aa = "G"} ;
  if ($codon eq "gta") {$aa = "V"} ;
  if ($codon eq "gtc") {$aa = "V"} ;
  if ($codon eq "gtg") {$aa = "V"} ;
  if ($codon eq "gtt") {$aa = "V"} ;
  if ($codon eq "taa") {$aa = "*"} ;
  if ($codon eq "tac") {$aa = "Y"} ;
  if ($codon eq "tag") {$aa = "*"} ;
  if ($codon eq "tat") {$aa = "Y"} ;
  if ($codon eq "tca") {$aa = "S"} ;
  if ($codon eq "tcc") {$aa = "S"} ;
  if ($codon eq "tcg") {$aa = "S"} ;
  if ($codon eq "tct") {$aa = "S"} ;
  if ($codon eq "tga") {$aa = "*"} ;
  if ($codon eq "tgc") {$aa = "C"} ;
  if ($codon eq "tgg") {$aa = "W"} ;
  if ($codon eq "tgt") {$aa = "C"} ;
  if ($codon eq "tta") {$aa = "L"} ;
  if ($codon eq "ttc") {$aa = "F"} ;
  if ($codon eq "ttg") {$aa = "L"} ;
  if ($codon eq "ttt") {$aa = "F"} ;
  $aa ;
}

sub translate {
  my($p,$q,$aa,$codon,$flt1,$ntlen,$ntseq,$protseq,$protlen) ;
  $ntseq = $_[0] ;
  $ntseq = lc($ntseq) ;
  $ntlen = length($ntseq) ;
  $flt1 = ($ntlen/3) ;
  $protlen = floor($flt1) ;
  $protseq = "" ;
  for ($p=0;$p<$protlen;$p++) {
    $q=$p*3;
    $codon = substr($ntseq,$q,3) ;
    $aa = &codontoaa($codon) ;
    $protseq = $protseq . $aa ;
  }
  $protseq ;
}

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
open(REJECTF, ">reject3.out") ;
open(SUMF, ">sum3.out") ;


#read in sequence and quality lines from input file

print REJECTF "**** N18, AscI, Illumina, Ub seq or spacinG rejected ****\n" ;


$ill = "AGATCGGAAGAGCGTCGT" ;
$startseq = "AGTATG" ;
$hsp90wtdna = "ATGGCTAGTGAAACTTTTGAATTTCAAGCTGAAATTACTCAGTTGATGAGTTTGATCATCAACACCGTCTATTCTAACAAGGAAATTTTCTTGAGAGAACTGATATCTAATGCCTCGGATGCGCTAGATAAAATTAGATACAAATCTTTGTCTGATCCAAAGCAATTGGAAACAGAACCAGATCTCTTTATTAGAATCACTCCAAAGCCAGAGCAAAAAGTTTTGGAAATCAGAGATTCTGGTATTGGTATGACCAAGGCTGAATTGATTAATAACTTGGGTACCATTGCCAAGTCTGGTACCAAAGCCTTCATGGAAGCTCTATCTGCTGGTGCCGATGTATCCATGATTGGTCAATTCGGTGTTGGTTTTTACTCTTTATTCTTAGTTGCCGACAGAGTTCAGGTTATTTCAAAGAGCAACGACGACGAACAATACATCTGGGAATCTAACGCTGGTGGTTCTTTCACTGTTACTCTAGACGAAGTTAATGAAAGAATTGGTAGGGGTACCATCTTGAGGTTATTCTTGAAAGATGACCAATTGGAGTACTTGGAAGAAAAGAGAATAAAGGAAGTTATCAAGAGACATTCTGAGTTCGTGGCCTACCCAATCCAATTAGTCGTCACCAAGGAAGTTGAAAAGGAAGTTCCAATTCCAGAAGAAGAAAAGAAAGACGAGGAAAAGAAGGATGAGGAAAAGAAGGATGAAGACGACAAGAAACCAAAACTCGAGGAAGTCGATGAAGAAGAGGAAAAGAAGCCAAAGACGAAAAAAGTTAAAGAAGAAGTTCAAGAGATAGAAGAACTAAACAAGACTAAGCCTTTGTGGACTAGAAACCCATCTGATATCACTCAAGAAGAATACAATGCTTTCTATAAGTCTATTTCAAACGACTGGGAAGACCCATTGTACGTTAAGCATTTCTCCGTTGAAGGTCAATTGGAATTTAGAGCTATCTTATTCATTCCAAAGAGAGCACCATTCGACTTGTTTGAGAGTAAAAAGAAGAAGAATAATATCAAGTTGTACGTTCGTCGTGTTTTCATCACTGATGAAGCTGAAGACTTGATTCCAGAGTGGTTATCTTTCGTCAAGGGTGTTGTTGACTCTGAGGATTTACCATTGAATTTGTCCAGAGAAATGTTACAACAAAATAAGATCATGAAGGTTATTAGAAAGAACATTGTCAAAAAGTTGATTGAAGCCTTCAACGAAATTGCTGAAGACTCTGAACAATTTGAAAAGTTCTACTCGGCTTTCTCCAAAAATATCAAGTTGGGTGTACATGAAGATACCCAAAACAGGGCTGCTTTGGCTAAGTTGTTACGTTACAACTCTACCAAGTCCGTAGATGAGTTGACTTCCTTAACTGATTACGTTACCAGAATGCCAGAACACCAAAAGAACATCTACTACATCACTGGTGAATCTCTAAAGGCTGTCGAAAAGTCTCCATTTTTGGATGCCTTGAAGGCTAAAAACTTCGAGGTTTTGTTCTTGACCGACCCAATTGATGAATACGCCTTCACTCAATTGAAGGAATTCGAAGGTAAAACTTTGGTTGACATTACTAAAGATTTCGAATTGGAAGAAACTGACGAAGAAAAAGCTGAAAGAGAGAAGGAGATCAAAGAATATGAACCATTGACCAAAGCTTTGAAAGAAATTTTGGGTGACCAAGTGGAGAAAGTTGTTGTTTCTTACAAATTGCTAGATGCCCCAGCTGCTATCAGAACTGGTCAATTTGGTTGGTCTGCTAACATGGAAAGAATCATGAAGGCTCAAGCCTTGAGAGACTCTTCCATGTCCTCCTACATGTCTTCCAAGAAGACTTTCGAAATTTCTCCAAAATCTCCAATTATCAAGGAATTGAAAAAGAGAGTTGACGAAGGTGGTGCTCAAGACAAGACTGTCAAGGACTTGACTAAGTTATTATATGAAACTGCTTTGTTGACTTCCGGCTTCAGTTTGGACGAACCAACTTCCTTTGCATCAAGAATTAACAGATTGATCTCTTTAGGCCTGAACATTGATGAGGATGAAGAAACAGAGACTGCTCCAGAAGCATCCACCGCAGCTCCGGTTGAAGAGGTTCCAGCTGACACCGAAATGGAAGAGGTAGATTAA" ;


$nok=0;
$nrej_ill=0;
$nrej_start=0;
$nrej_hsp90=0;

while ($line = <INF>) {
  chomp($line) ;
  $seq=$line ;
  $locill = index($seq,$ill) ;
  $locstartseq = index($seq,$startseq) ;
  $start = $locstartseq+3 ;
  $hsp90_dna = substr($seq,$start,2130) ;
  $ok=1;
  if ($locill < 0) {
    $nrej_ill++ ;
    print REJECTF "Illumina missing\n$line\n" ;
    $ok=0;
  } else {
    $bc = substr($seq,$locill-18,18) ;
  }
  if ($locstartseq < 0) {
    $nrej_start++ ;
    print REJECTF "Start sequence missing\n$line\n" ;
    $ok=0;
  }
# check hsp90 sequence
  if ($ok>0) {
    $mut_aa = "";
    $mut_nt = "";
    $nmut = 0 ;
    for ($i=0;$i<711;$i++) {
      $iaa = $i+1;
      $codon = substr($hsp90_dna,$i*3,3);
      $wtcodon = substr($hsp90wtdna,$i*3,3);
      $aa=&codontoaa($codon);
      $wtaa=&codontoaa($wtcodon);
      if ($codon ne $wtcodon) {
        $d1 = "$wtcodon$iaa$codon" ;
        $d2 =  "$wtaa$iaa$aa" ;
        $mut_aa = $mut_aa . $d2 .";" ;
        $mut_nt = $mut_nt . $d1 .";";
        $nmut++ ;
      }
    }
  }
  if ($nmut > 4) {
    $ok=0;
    print REJECTF "too many mutations $mut_nt $mutaa\n$seq\n" ;
    $nrej_hsp90++ ;
  }

  if ($ok==1) {
    $nok++ ;
    print OUTF "$bc\,$nmut\,$mut_nt\,$mut_aa\n" ;
  }
}

print SUMF "ok $nok\n" ;
print SUMF "Rejected illumina $nrej_ill\n" ;
print SUMF "Rejected SpeI/hsp90_start $nrej_start\n" ;
print SUMF "Rejected multiple Hsp90 mutations $nrej_hsp90\n" ;

close(INF) ;
close(OUTF) ;
close(REJECTF) ;
close(SUMF)
