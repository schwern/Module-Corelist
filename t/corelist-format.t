#!/usr/bin/perl

# This test will only work for this version of Module::CoreList.
# It exists to prove the refactoring correct.

use strict;
use warnings;

use Test::Differences;
use Test::More 'no_plan';

eq_or_diff scalar `$^X -Ilib ./corelist -a Test::Harness`, <<'END';

Test::Harness was first released with perl 5
  5          undef     
  5.000      undef     
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
  v5.10.0    2.64      
  v5.10.1    3.17      
  v5.11.0    3.17      
  v5.11.0    3.17      
  v5.11.1    3.17      
  v5.11.2    3.17      
  v5.11.3    3.17      
  v5.11.4    3.17      
  v5.11.5    3.17      
  v5.12.0    3.17      
  v5.12.0    3.17      

END
