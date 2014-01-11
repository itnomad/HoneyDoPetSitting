#!/usr/bin/perl 
#===============================================================================
#
#         FILE: set_hashed_passwords.pl
#
#        USAGE: ./set_hashed_passwords.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: John Lupton -Jack- (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 01/08/2014 09:31:17 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use HoneyDoPetSitting::Schema;

my $schema = HoneyDoPetSitting::Schema->connect('dbi:SQLite:honeydopetsitting.db');

my @users = $schema->resultset('User')->all;

foreach my $user (@users) {
        $user->password('mypass');
        $user->update;
}

