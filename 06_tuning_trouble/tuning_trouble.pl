use strict; use warnings;
use File::Basename;

$\ = "\n";

my $filename = dirname(__FILE__) . "/LIST.txt";
open(my $fh, "<", $filename) or die $!;
my $chars = <$fh>;

for my $i (1 .. length $chars) {
    my @char = split //, substr($chars, $i-1, 4);
    my %uniq; 
    @uniq{@char} = (); 
    my $count = scalar keys %uniq;
    if ($count == 4) {
        print($i+3);
        last;
    }
}

for my $i (1 .. length $chars) {
    my @char = split //, substr($chars, $i-1, 14);
    my %uniq; 
    @uniq{@char} = (); 
    my $count = scalar keys %uniq;
    if ($count == 14) {
        print($i+13);
        last;
    }
}

close($fh);
