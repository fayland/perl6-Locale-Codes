#!/usr/bin/perl

use v5.10;
use strict;
use warnings;
use YAML::Syck qw(LoadFile);
use FindBin qw/$Bin/;
use Data::Dumper;

# curr.yaml is from perl5 Locale::Codes internal
my $data = LoadFile("$Bin/curr.yaml");

my $country = $data->{country};
open(my $fh, '>', $Bin . '/../lib/Locale/Codes/Country_Codes.pm');
print $fh 'unit module Locale::Codes::Country_Codes;' . "\n\n";
print $fh 'my $data = q{' . "\n";
foreach my $code (sort keys %{ $country->{'alpha-2'}->{code} }) {
    my $name = $country->{'alpha-2'}->{code}->{$code};
    my $alpha3 = $country->{'alpha-3'}->{name}->{lc $name}->[0];
    my $dom = $country->{'dom'}->{name}->{lc $name}->[0];
    my $numeric = $country->{'numeric'}->{name}->{lc $name}->[0];
    print Dumper([$code, $alpha3, $dom, $numeric, $name]);
    # die unless $dom eq $code;
    print $fh join(':', uc $code, uc $alpha3, $numeric, $name) . "\n";
}
print $fh '};' . "\n";
print $fh <<'CODE';

our %data;
for $data.trim.split("\n") -> $line {
    my @parts = $line.split(':');
    %data<code><alpha-2>{@parts[0]} = @parts[3];
    %data<code><alpha-3>{@parts[1]} = @parts[3];
    %data<code><numeric>{@parts[2]} = @parts[3];
    %data<name><alpha-2>{lc @parts[3]} = @parts[0];
    %data<name><alpha-3>{lc @parts[3]} = @parts[1];
    %data<name><numeric>{lc @parts[3]} = @parts[2];
}

CODE
close($fh);