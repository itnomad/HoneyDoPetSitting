use strict;
use warnings;

use HoneyDoPetSitting;

my $app = HoneyDoPetSitting->apply_default_middlewares(HoneyDoPetSitting->psgi_app);
$app;

