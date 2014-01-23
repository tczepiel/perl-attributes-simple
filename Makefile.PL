use strict;
use warnings;

use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Attributes::Simple',
    VERSION_FROM      => 'lib/Attributes/Simple.pm',
    PREREQ_PM         => {
        'Package::Stash' => 0,
    },
     ($] >= 5.005 ?
           (ABSTRACT      => 'Declare package-specific attributes.',
           AUTHOR         => 'Tomasz Czepiel') : ()),
);
