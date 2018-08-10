use strict;
use warnings;

use ExtUtils::MakeMaker;
WriteMakefile(
  NAME           => 'PerlIpParsing',
  LICENSE        => 'MIT',
  PREREQ_PM      => {
    'Exporter'   => '0',
  },
  TEST_REQUIRES => {
    'Test::More' => '1.00',
  },
);
