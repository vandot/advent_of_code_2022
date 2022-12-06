use strict; use warnings;
no warnings 'uninitialized';
use File::Basename;

$\ = "\n";

my $filename = dirname(__FILE__) . "/LIST.txt";
open(my $fh, "<", $filename) or die $!;
my $chars = <$fh>;
my $sop;
my $som;

for my $i (1 .. length $chars) {
    if (length $sop == 0) {
        my @char_sop = split //, substr($chars, $i-1, 4);
        my %uniq_sop; 
        @uniq_sop{@char_sop} = (); 
        my $count_sop = scalar keys %uniq_sop;
        if ($count_sop == 4) {
            $sop = $i + 3;
        }
    }
    if (length $som == 0) {
        my @char_som = split //, substr($chars, $i-1, 14);
        my %uniq_som; 
        @uniq_som{@char_som} = (); 
        my $count_som = scalar keys %uniq_som;
        if ($count_som == 14) {
            $som = $i + 13
        }
    }
    if ((length $sop != 0) && (length $som != 0)) {
        print($sop);
        print($som);
        last;
    }
}

close($fh);
