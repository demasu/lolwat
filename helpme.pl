#!/usr/bin/env bash

echo "Which program do you need help with? "
read program
echo "Run this command: 'man $program' (without quotes)"
if [ -e `which $program` ]; then
    echo "Like this. That wasn't so hard was it?"
   $(which man) $program
fi

exit

#!/usr/bin/env perl

use feature qw(say);
use strict;
use warnings;

my $os = $^O;

#For the helps

print "Which program do you need help with? ";
chomp( my $program = <STDIN> );

if ( $os =~ /MSWin32/ ) {
    say "Run this command: '$program /?' (without quotes)";

    my $found = system( "where", "$program" );
    if ( $found ) {
        say "Like this. That wasn't so hard was it?";
        system( $program, "/?" );
    }
}
elsif ( $os =~/Linux/ || $os =~ /darwin/) {
    say "Run this command: 'man $program' (without quotes)";

    my $found = system( "which", "$program" );
    if ( $found ) {
        say "Like this. That wasn't so hard was it?";
        system( "man", $program );
    }
}
else {
    say "How do you expect help if you can't run this on a recognized system?";
}

