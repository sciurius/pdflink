#!/usr/bin/perl

# pdflink -- insert links into PDF files

# Author          : Johan Vromans
# Created On      : Thu Sep 15 11:43:40 2016
# Last Modified By: Johan Vromans
# Last Modified On: Mon Dec 12 16:11:55 2016
# Update Count    : 254
# Status          : Unknown, Use with caution!

################ Common stuff ################

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../CPAN";
use lib "$FindBin::Bin/../lib";
use App::PDF::Link;

################ Setup  ################

# Process command line options, config files, and such.
my $env = App::PDF::Link->app_setup( "pdflink", $App::PDF::Link::VERSION );

################ Activate ################

App::PDF::Link->run($env);

1;
