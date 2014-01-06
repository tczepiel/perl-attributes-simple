use strict;
use warnings;

use Test::More qw(no_plan);

use Attributes::Simple qw(CODE get_attributes);

sub blah :Meh { 1 }

my @a = get_attributes('main', \&blah);

cmp_ok($a[0], 'eq', 'Meh');


