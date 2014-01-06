use strict;
use warnings;

use Test::More qw(no_plan);

use Attributes::Simple qw(CODE);
use attributes qw();

sub blah :Meh { 1 }

my @a = attributes::get(\&blah);

cmp_ok($a[0], 'eq', 'Meh');


