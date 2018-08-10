#!/bin/bash

directory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd)"
perl -I/$directory/../lib $directory/ip_batch_parser_example.pl
