use strict;
use warnings;

use Leak;

my $app = Leak->apply_default_middlewares(Leak->psgi_app);
$app;

