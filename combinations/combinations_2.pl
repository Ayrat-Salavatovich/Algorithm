#!/usr/bin/perl -w
# combinations_2.pl --- Сочетания с повторениями
# Author:  <Ayrat.Salavatovich@analyst.mx>
# Created: 07 Nov 2016
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
    my $h = $n > $m ? $n : $m; # размер массива а выбирается как max(n,m)
    $arr = [(1) x $h];
    Print $arr, $m;
    Print $arr, $m while NextSet $arr, $n, $m;
}

sub NextSet($$$) {
    my ($a, $n, $m) = @_;
    my $j = $m - 1;
    $j-- while $j >= 0 && @$a[$j] == $n;
    return 0 if $j < 0;
    $j-- if @$a[$j] >= $n;
    @$a[$j]++;
    return 1 if $j == $m-1;
    @$a[$_] = @$a[$j] for $j+1 .. $m-1; # значения меньше a[j] уже использованы в сочетаниях
    return 1;
}

sub Print($$) {
    my ($a, $n) = @_;
    state $num = 1;
    say sprintf("%3d: ", $num++), join(' ', @$a[0 .. $n-1]);
}

&main;


__END__
