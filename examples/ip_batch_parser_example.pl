#!/usr/bin/perl
use strict;
use warnings;

use ip_batch_parser qw(parse_ip_batches);

# An example function for demonstrating how
# functions can be passed to parse_ip_batches.
#
# Prints the input to standard output.
#
# @param [String] $ip_batch
#   a batch of IPs to print out.
sub print_batch {
  my ($ip_batch) = @_;
  print "Batch of IPs: ${ip_batch}\n";
}

# Random IPs generated via https://www.browserling.com/tools/random-ip,
# with a few arbitrary ranges added on.
my $ips = '71.220.20.4%2C99.219.247.241%2C60.23.64.34%2F30%2C180.71.208.66%2C79.238.10.234%2C126.201.183.25%2C147.57.241.69%2C250.122.205.201%2F31%2C208.253.111.57%2C229.89.220.180%2C163.233.178.32%2F10%2C74.165.113.172%2C168.242.128.144%2C175.107.159.143%2C52.242.37.49%2C233.6.194.6%2F30%2C50.70.70.230%2F30%2C248.5.131.103%2C169.90.201.130%2C182.70.167.105%2C135.80.100.48%2C206.39.254.45%2C71.124.235.122%2C239.227.176.10%2C73.162.189.129%2C172.126.42.122%2C108.166.164.57%2C163.83.97.40%2C54.100.153.143%2C141.189.219.184%2C201.180.74.1%2C109.67.235.9%2C154.87.188.219%2C249.217.57.213%2C210.241.220.126%2C128.205.74.152%2C206.113.63.71%2C83.198.100.153%2F32%2C199.203.251.64%2C216.179.70.198';
ip_batch_parser::parse_ip_batches(\&print_batch, $ips);
