#!/usr/bin/perl -w
# combinations_1.pl --- Сочетания без повторений
# Author:  <Ayrat.Salavatovich@analyst.mx>
# Created: 06 Nov 2016
# Version: 0.01

use warnings;
use strict;
use v5.14;

sub Print($$);
sub NextSet($$$);

sub main {
    my ($n, $m, $arr);
    print "N = ";
    chomp($n = <>);
    print "M = ";
    chomp($m = <>);
    @$arr[$_ - 1] = $_ for 1 .. $n;
    Print $arr, $m;
    if ($n >= $m) {
        Print $arr, $m while NextSet $arr, $n, $m;
    }
}

sub NextSet($$$) {
    my ($a, $n, $m) = @_;
    state $last = $n;
    my $j = $m;
    $j++ while $j < $last && @$a[$j] < @$a[$m-1];
    if ( $j < $last ) {
        @$a[$m-1, $j] = @$a[$j, $m-1];
        return 1;
    }
    @$a[$_, $_+1] = @$a[$_+1, $_] for $m-1 .. $last-2;
    my $d = @$a[0];
    @$a[$_] = @$a[$_+1] for 0 .. $last-2;
    @$a[$last-1] = $d;
    $last--;
    return 0 if $last < $m;
    return 1;
}

sub Print($$) {
    my ($a, $n) = @_;
    state $num = 1;
    say sprintf("%3d: ", $num++), join(' ', @$a[0 .. $n-1]);
}

&main;

__END__
