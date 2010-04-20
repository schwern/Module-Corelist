#!/usr/bin/perl

# This test will break when the data in Module::CoreList changes.
# It could be made generic, but the data changes infrequently, and
# its much simpler to maintain manually.

use strict;
use warnings;

use Test::More 'no_plan';

# The core doesn't have Test::Differences, but its really handy
# so emulate it with is() if its not available.
BEGIN {
    if( eval { require Test::Differences } ) {
        *eq_or_diff = \&Test::Differences::eq_or_diff;
    }
    else {
        *eq_or_diff = \&is;
    }
}

# corelist -a
eq_or_diff scalar `$^X -Ilib ./corelist -a Test::Harness`, <<'END', "corelist -a";

Test::Harness was first released with perl 5
  5          undef     
  5.001      undef     
  5.002      1.07      
  5.00307    1.13      
  5.004      1.1502    
  5.00405    1.1602    
  5.005      1.1602    
  5.00503    1.1602    
  5.00504    1.1602    
  v5.6.0     1.1604    
  v5.6.1     1.1604    
  v5.6.2     2.30      
  v5.7.3     2.01      
  v5.8.0     2.26      
  v5.8.1     2.30      
  v5.8.2     2.30      
  v5.8.3     2.40      
  v5.8.4     2.40      
  v5.8.5     2.42      
  v5.8.6     2.42      
  v5.8.7     2.48      
  v5.8.8     2.56      
  v5.8.9     2.64      
  v5.9.0     2.30      
  v5.9.1     2.40      
  v5.9.2     2.46      
  v5.9.3     2.56      
  v5.9.4     2.62      
  v5.9.5     2.64      
  v5.10.0    2.64      
  v5.10.1    3.17      
  v5.11.0    3.17      
  v5.11.1    3.17      
  v5.11.2    3.17      
  v5.11.3    3.17      
  v5.11.4    3.17      
  v5.11.5    3.17      
  v5.12.0    3.17      

END


# corelist -v
eq_or_diff scalar `$^X -Ilib ./corelist -v`, <<'END', "corelist -v";

Module::CoreList has info on the following perl versions:
5
5.001
5.002
5.00307
5.004
5.00405
5.005
5.00503
5.00504
v5.6.0
v5.6.1
v5.6.2
v5.7.3
v5.8.0
v5.8.1
v5.8.2
v5.8.3
v5.8.4
v5.8.5
v5.8.6
v5.8.7
v5.8.8
v5.8.9
v5.9.0
v5.9.1
v5.9.2
v5.9.3
v5.9.4
v5.9.5
v5.10.0
v5.10.1
v5.11.0
v5.11.1
v5.11.2
v5.11.3
v5.11.4
v5.11.5
v5.12.0

END


# corelist -v PerlVersion
my @out = `$^X -Ilib ./corelist -v 5.006`;
is $out[1], "The following modules were in perl 5.006 CORE\n", "corelist -v X.YYY";

@out = `$^X -Ilib ./corelist -v 5.6.0`;
is $out[1], "The following modules were in perl 5.6.0 CORE\n", "corelist -v X.Y.Z";

@out = `$^X -Ilib ./corelist -v v5.6.0`;
is $out[1], "The following modules were in perl v5.6.0 CORE\n", "corelist -v vX.Y.Z";

is `$^X -Ilib ./corelist -v 5.006 Test::Harness`, <<'END', "corelist -v X.YYY Module";
Test::Harness 1.1604
END

is `$^X -Ilib ./corelist -v 5.6.0 Test::Harness`, <<'END', "corelist -v X.Y.Z Module";
Test::Harness 1.1604
END

is `$^X -Ilib ./corelist -v v5.6.0 Test::Harness`, <<'END', "corelist -v vX.Y.Z Module";
Test::Harness 1.1604
END
