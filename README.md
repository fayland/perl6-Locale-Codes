# perl6-Locale-Codes

[![Build Status](https://travis-ci.org/fayland/perl6-Locale-Codes.svg?branch=master)](https://travis-ci.org/fayland/perl6-Locale-Codes)

## SYNOPSIS

```
use Locale::Country;

my $country = code2country('JP'); # 'Japan'
my $country = code2country('CHN'); # 'China'
my $country = code2country('250'); # 'France'

my $code = country2code('Norway'); # 'NO'
my $code = country2code('Norway', 'alpha-3'); # 'NOR'
my $code = country2code('Norway', 'numeric'); # '578'

my @codes = all_country_codes();
my @codes = all_country_codes(LOCALE_CODE_ALPHA_3);

my @names = all_country_names();
```

## Locale::Country

### code2country

supports alpha-2, alpha-3, numeric

```
my $country = code2country('JP'); # 'Japan'
my $country = code2country('CHN'); # 'China'
my $country = code2country('250'); # 'France'
```

### country2code

```
my $code = country2code('Norway'); # 'NO', default alpha-2
my $code = country2code('Norway', LOCALE_CODE_ALPHA_2), 'NO';
my $code = country2code('Norway', 'numeric'); # '578'
```

### all_country_codes

```
my @codes = all_country_codes(); # alpha-2
my @codes = all_country_codes('alpha-3');
my @codes = all_country_codes(LOCALE_CODE_NUMERIC);
```

### all_country_codes

```
my @codes = all_country_codes();
my @codes = all_country_codes(LOCALE_CODE_ALPHA_3);
```

###

```
my @names = all_country_names();
```