use strict;
use warnings;
use Test::More tests => 2;

use Attributes::Simple qw(CODE);
use attributes qw();

sub some_sub :FOO { 1 }

sub bar :Baz(foo) {
    return 'bar';
}

cmp_ok(attributes::get(\&some_sub)->[0], 'eq', 'FOO');
cmp_ok(attributes::get(\&bar)->[0],'eq', 'Baz(foo)');



