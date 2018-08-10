use strict;
use warnings;
use diagnostics;

use ip_batch_parser qw(extract_ip_batches);

use Test::More qw( no_plan );

do 'ip_batch_parser.pl';

# Test the empty input case
my @empty_batch_matches = ip_batch_parser::extract_ip_batches('');
is_deeply(\@empty_batch_matches, []);

# Test the single batch case
my $single_batch_input = '192.0.0.1%2C192.0.0.2%2C192.0.0.3%2C192.0.0.4';
my @single_batch_matches = ip_batch_parser::extract_ip_batches($single_batch_input);
is_deeply(\@single_batch_matches, [$single_batch_input]);

# Test the multiple batches case
my @multi_batch_matches = ip_batch_parser::extract_ip_batches(
  '192.0.0.1%2C192.0.0.2%2C192.0.0.3%2C192.0.0.4%2C192.0.0.5%2C192.0.0.6'
);
is_deeply(
  \@multi_batch_matches,
  [
    '192.0.0.1%2C192.0.0.2%2C192.0.0.3%2C192.0.0.4%2C192.0.0.5',
    '192.0.0.6'
  ]
);

# Test the not-an-IP case
my @invalid_batch_matches = ip_batch_parser::extract_ip_batches('Hello!');
is_deeply(\@invalid_batch_matches, []);
