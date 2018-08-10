package ip_batch_parser;

use strict;
use warnings;

require Exporter;
our @EXPORT_OK = qw(extract_ip_batches parse_ip_batches);

use constant IP_RANGE_PATTERN => '(?:\d{1,3}\.){3}\d{1,3}(?:\%2F\d{1,3})?';

# Splits an input string of IP ranges into batches
# of up to 5 IP ranges each.
#
# If anyone knows a way to pass in the batch size
# as a parameter to this function, let me know.
#
# @param [String] $ips
#   sequence of IPs and IP ranges concatenated with '%2C'.
# @return [Array<String>]
#   batches of IP ranges, each containing up to 5 IP ranges.
sub extract_ip_batches {
  my ($ips) = @_;
  return $ips =~ /(?:${\(IP_RANGE_PATTERN)}\%2C){0,4}${\(IP_RANGE_PATTERN)}/smg
}

# Splits an input string of IP ranges into batches
# and calls the input operation on each batch.
#
# Only pass in functions that you have defined
# yourself, as this is otherwise terrifically unsafe.
#
# @param [Function] $operation
#   reference to the function to call on each batch.
# @param [String] $ips
#   sequence of IPs and IP ranges concatenated with '%2C'.
sub parse_ip_batches {
  my ($operation, $ips) = @_;

  my @matches = extract_ip_batches($ips);
  if (@matches) {
    foreach my $match (@matches) {
      $operation->($match);
    }
  }
}

1;
