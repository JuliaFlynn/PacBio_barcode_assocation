#!/usr/bin/perl
#
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



sub itoaa {
  my($i,$aa);
  $i = $_[0];
  $aa="X";
  if ($i == 0) {$aa="*"} ;
  if ($i == 1) {$aa="W"} ;
  if ($i == 2) {$aa="Y"} ;
  if ($i == 3) {$aa="F"} ;
  if ($i == 4) {$aa="L"} ;
  if ($i == 5) {$aa="I"} ;
  if ($i == 6) {$aa="V"} ;
  if ($i == 7) {$aa="M"} ;
  if ($i == 8) {$aa="C"} ;
  if ($i == 9) {$aa="A"} ;
  if ($i == 10) {$aa="G"} ;
  if ($i == 11) {$aa="P"} ;
  if ($i == 12) {$aa="S"} ;
  if ($i == 13) {$aa="T"} ;
  if ($i == 14) {$aa="N"} ;
  if ($i == 15) {$aa="Q"} ;
  if ($i == 16) {$aa="D"} ;
  if ($i == 17) {$aa="E"} ;
  if ($i == 18) {$aa="H"} ;
  if ($i == 19) {$aa="K"} ;
  if ($i == 20) {$aa="R"} ;
  $aa ;
}

sub aatoi {
  my($i,$aa);
  $aa = $_[0];
  $i=-1;
  if ($aa eq "*") {$i=0} ;
  if ($aa eq "W") {$i=1} ;
  if ($aa eq "Y") {$i=2} ;
  if ($aa eq "F") {$i=3} ;
  if ($aa eq "L") {$i=4} ;
  if ($aa eq "I") {$i=5} ;
  if ($aa eq "V") {$i=6} ;
  if ($aa eq "M") {$i=7} ;
  if ($aa eq "C") {$i=8} ;
  if ($aa eq "A") {$i=9} ;
  if ($aa eq "G") {$i=10} ;
  if ($aa eq "P") {$i=11} ;
  if ($aa eq "S") {$i=12} ;
  if ($aa eq "T") {$i=13} ;
  if ($aa eq "N") {$i=14} ;
  if ($aa eq "Q") {$i=15} ;
  if ($aa eq "D") {$i=16} ;
  if ($aa eq "E") {$i=17} ;
  if ($aa eq "H") {$i=18} ;
  if ($aa eq "K") {$i=19} ;
  if ($aa eq "R") {$i=20} ;
  $i ;
}

if ($#ARGV!=1) {
  print "usage: script.pl infile outfile\n";
  exit;
}

$infile = $ARGV[0];
$outfile = $ARGV[1];

$wtdna = "ATGGCTAGTGAAACTTTTGAATTTCAAGCTGAAATTACTCAGTTGATGAGTTTGATCATCAACACCGTCTATTCTAACAAGGAAATTTTCTTGAGAGAACTGATATCTAATGCCTCGGATGCGCTAGATAAAATTAGATACAAATCTTTGTCTGATCCAAAGCAATTGGAAACAGAACCAGATCTCTTTATTAGAATCACTCCAAAGCCAGAGCAAAAAGTTTTGGAAATCAGAGATTCTGGTATTGGTATGACCAAGGCTGAATTGATTAATAACTTGGGTACCATTGCCAAGTCTGGTACCAAAGCCTTCATGGAAGCTCTATCTGCTGGTGCCGATGTATCCATGATTGGTCAATTCGGTGTTGGTTTTTACTCTTTATTCTTAGTTGCCGACAGAGTTCAGGTTATTTCAAAGAGCAACGACGACGAACAATACATCTGGGAATCTAACGCTGGTGGTTCTTTCACTGTTACTCTAGACGAAGTTAATGAAAGAATTGGTAGGGGTACCATCTTGAGGTTATTCTTGAAAGATGACCAATTGGAGTACTTGGAAGAAAAGAGAATAAAGGAAGTTATCAAGAGACATTCTGAGTTCGTGGCCTACCCAATCCAATTAGTCGTCACCAAGGAAGTTGAAAAGGAAGTTCCAATTCCAGAAGAAGAAAAGAAAGACGAGGAAAAGAAGGATGAGGAAAAGAAGGATGAAGACGACAAGAAACCAAAACTCGAGGAAGTCGATGAAGAAGAGGAAAAGAAGCCAAAGACGAAAAAAGTTAAAGAAGAAGTTCAAGAGATAGAAGAACTAAACAAGACTAAGCCTTTGTGGACTAGAAACCCATCTGATATCACTCAAGAAGAATACAATGCTTTCTATAAGTCTATTTCAAACGACTGGGAAGACCCATTGTACGTTAAGCATTTCTCCGTTGAAGGTCAATTGGAATTTAGAGCTATCTTATTCATTCCAAAGAGAGCACCATTCGACTTGTTTGAGAGTAAAAAGAAGAAGAATAATATCAAGTTGTACGTTCGTCGTGTTTTCATCACTGATGAAGCTGAAGACTTGATTCCAGAGTGGTTATCTTTCGTCAAGGGTGTTGTTGACTCTGAGGATTTACCATTGAATTTGTCCAGAGAAATGTTACAACAAAATAAGATCATGAAGGTTATTAGAAAGAACATTGTCAAAAAGTTGATTGAAGCCTTCAACGAAATTGCTGAAGACTCTGAACAATTTGAAAAGTTCTACTCGGCTTTCTCCAAAAATATCAAGTTGGGTGTACATGAAGATACCCAAAACAGGGCTGCTTTGGCTAAGTTGTTACGTTACAACTCTACCAAGTCCGTAGATGAGTTGACTTCCTTAACTGATTACGTTACCAGAATGCCAGAACACCAAAAGAACATCTACTACATCACTGGTGAATCTCTAAAGGCTGTCGAAAAGTCTCCATTTTTGGATGCCTTGAAGGCTAAAAACTTCGAGGTTTTGTTCTTGACCGACCCAATTGATGAATACGCCTTCACTCAATTGAAGGAATTCGAAGGTAAAACTTTGGTTGACATTACTAAAGATTTCGAATTGGAAGAAACTGACGAAGAAAAAGCTGAAAGAGAGAAGGAGATCAAAGAATATGAACCATTGACCAAAGCTTTGAAAGAAATTTTGGGTGACCAAGTGGAGAAAGTTGTTGTTTCTTACAAATTGCTAGATGCCCCAGCTGCTATCAGAACTGGTCAATTTGGTTGGTCTGCTAACATGGAAAGAATCATGAAGGCTCAAGCCTTGAGAGACTCTTCCATGTCCTCCTACATGTCTTCCAAGAAGACTTTCGAAATTTCTCCAAAATCTCCAATTATCAAGGAATTGAAAAAGAGAGTTGACGAAGGTGGTGCTCAAGACAAGACTGTCAAGGACTTGACTAAGTTATTATATGAAACTGCTTTGTTGACTTCCGGCTTCAGTTTGGACGAACCAACTTCCTTTGCATCAAGAATTAACAGATTGATCTCTTTAGGCCTGAACATTGATGAGGATGAAGAAACAGAGACTGCTCCAGAAGCATCCACCGCAGCTCCGGTTGAAGAGGTTCCAGCTGACACCGAAATGGAAGAGGTAGATTAA" ;


open(INF, $infile) ;
open(OUTF, ">$outfile") ;
open(REJECTF, ">reject5.out") ;
open(SUMF, ">sum5.out") ;

for ($i=0; $i<709; $i++) {
  for ($j=0; $j<21; $j++) {
    $nbc[$i][$j]=0;
    $nreads[$i][$j]=0;
  }
}

while ($line = <INF>) {
  chomp($line) ;
  @spline = split (/,/, $line) ;
  $mutaa = $spline[3] ;
  $l=length($spline[1]) ;
  if ($l<6) {
    $tempreads = substr($spline[1],0,1) ;
  } else {
    $tempreads = substr($spline[1],0,2) ;
  }
  if ($spline[2]==0) {
    $nbc[0][0]++;
    $nreads[0][0]=$nreads[0][0]+$tempreads;
  } elsif ($spline[2]==1) {
    $l=length($mutaa) ;
    $aa=substr($mutaa,$l-1,1) ;
    $i=&aatoi($aa) ;
    $pos=substr($mutaa,1,$l-2) ;
    $nbc[$pos][$i]++;
    $nreads[$pos][$i]=$nreads[$pos][$i]+$tempreads;
  } else {
    print REJECTF "$line\n" ;
  }
}

print OUTF "Number of barcodes\n" ;
print OUTF "aa\," ;
for ($i=1; $i<306; $i++) {
  print OUTF "$i\," ;
}
print OUTF "\n" ;

for ($j=0; $j<21; $j++) {
  $aa=&itoaa($j) ;
  print OUTF "$aa\," ;
  for ($i=1; $i<709; $i++) {
    print OUTF "$nbc[$i][$j]\," ;
  }
  print OUTF "\n" ;
}

print OUTF "\n" ;
print OUTF "\n" ;
print OUTF "\n" ;
print OUTF "Number of barcode reads\n" ;
print OUTF "aa\," ;
for ($i=1; $i<709; $i++) {
  print OUTF "$i\," ;
}
print OUTF "\n" ;

for ($j=0; $j<21; $j++) {
  $aa=&itoaa($j) ;
  print OUTF "$aa\," ;
  for ($i=1; $i<306; $i++) {
    print OUTF "$nreads[$i][$j]\," ;
  }
  print OUTF "\n" ;
}

print OUTF "\n" ;
print OUTF "\n" ;
print OUTF "\n" ;
print OUTF "WT reads\n" ;
print OUTF "Number of WT barcodes $nbc[0][0]\n" ;
print OUTF "Number of WT reads $nreads[0][0]\n" ; 

#check for WT synonyms
print OUTF "\n" ;
print OUTF "\n" ;
print OUTF "\n" ;
print OUTF "WT synonyms\n" ;
print OUTF "position\, barcodes\, reads\n" ;
for ($i=0; $i<709; $i++) {
  $ntpos = $i*3 ;
  $wtcodon = substr($wtdna,$ntpos,3) ;
  $wtaa = &codontoaa($wtcodon) ;
  $iwtaa = &aatoi($wtaa) ;
  $aapos = $i+1 ;
  print OUTF "$aapos\, $nbc[$aapos][$iwtaa]\, $nreads[$aapos][$iwtaa]\n" ;
}

close(INF) ;
close(OUTF) ;
close(REJECTF) ;
close(SUMF) ;
