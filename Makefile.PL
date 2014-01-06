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
           (ABSTRACT_FROM  => 'lib/Attributes/Simple.pm', # retrieve abstract from module
           AUTHOR         => 'Tomasz Czepiel') : ()),
);
