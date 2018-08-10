# perl_ip_parsing
Sample scripts for parsing IPs and IP ranges

[<img src="https://travis-ci.org/msayson/perl_ip_parsing.svg?branch=master" alt="Build Status" />](https://travis-ci.org/msayson/perl_ip_parsing)

## Packages

### ip_batch_parser

```perl
# Splits an input string of IP ranges into batches
# of up to 5 IP ranges each.
#
# @param [String] $ips
#   sequence of IPs and IP ranges concatenated with '%2C'.
# @return [Array<String>]
#   batches of IP ranges, each containing up to 5 IP ranges.
sub extract_ip_batches;

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
sub parse_ip_batches;
```

## Running unit tests

```
perl Makefile.PL
make test
```
