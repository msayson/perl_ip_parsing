package ip_batch_parser;

use strict;
use warnings;

require Exporter;
our @EXPORT_OK = qw(parse_ip_batches);

use constant IP_RANGE_PATTERN => '(?:\d{1,3}\.){3}\d{1,3}(?:\%2F\d{1,3})?';

# Splits an input string of IP ranges into batches
# of up to 5 IP ranges each, and calls the input
# operation on each batch.
#
# Only pass in functions that you have defined
# yourself, as this is otherwise terrifically unsafe.
#
# If anyone knows a way to pass in the batch size
# as a parameter to this function, let me know.
#
# @param [Function] $operation
#   reference to the function to call on each batch.
# @param [String] $ips
#   sequence of IPs and IP ranges concatenated with '%2C'.
sub parse_ip_batches {
  my ($operation, $ips) = @_;
  my @matches;

  if (@matches = $ips =~ /(?:${\(IP_RANGE_PATTERN)}\%2C){0,4}${\(IP_RANGE_PATTERN)}/smg) {
    foreach my $match (@matches) {
      $operation->($match);
    }
  }
}

1;
