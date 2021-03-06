package Attributes::Simple;

use strict;
use warnings;

our $VERSION = "0.01";
use Package::Stash;

our %__ATTRIBUTES_LIST;

sub _mod_attributes {
    my ($pkg,$subref,@attrs) = @_;

    $__ATTRIBUTES_LIST{$subref} = \@attrs if @attrs;
    return;
}

sub _fetch_attributes {
    my ($pkg,$subref) = @_;

    my $attrs = $__ATTRIBUTES_LIST{$subref}
        or return;

    return wantarray ? @$attrs : $attrs;
}

sub import {
    my $pkg        = shift;
    my @attr_types = @_;

    my ($caller) = caller();

    my $p = Package::Stash->new($caller);
    for my $type (@attr_types) {
        $p->add_symbol("&MODIFY_${type}_ATTRIBUTES", \&_mod_attributes);
        $p->add_symbol("&FETCH_${type}_ATTRIBUTES", \&_fetch_attributes);
    }
}

sub get_attributes {
    my ($pkg,$subref) = @_;

    my $type   = ref($subref);
    my $method = "FETCH_${type}_ATTRIBUTES";

    return $pkg->$method($subref);
}

1;

__END__

=head1 NAME

Attributes::Simple

=head1 DESCRIPTION

Declare package-specific attributes.

=head1 SYNOPSIS

    use strict;
    use warnings;

    use Attributes::Simple qw(CODE); # types: SCALAR,ARRAY,CODE etc.

    require attributes;
    my @attrlist = attributes::get(\&foo);

    ...
    my @attrlist  = Attributes::Simple::get_attributes(\(my $foo : Bar = 1 ));

=head1 SEE ALSO

L<Attributes::Handler>

L<attributes>


