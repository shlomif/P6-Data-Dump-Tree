#!/usr/bin/env perl6

use Test ;
plan 10 ;

use Data::Dump::Tree;
use Data::Dump::Tree::DescribeBaseObjects ;

my $dump = ddt :get, '1234567890' x 6, title => 't:', width => 79, color => False, does => (DDTR::AsciiGlyphs,) ;
is $dump.lines.elems, 1, '1 line, default width setting' or diag $dump ;

$dump = ddt :get, '1234567890' x 8, title => 't:', color => False, width => 79, does => (DDTR::AsciiGlyphs,) ;
is $dump.lines.elems, 4, '4 lines, default width setting' or diag $dump ;

$dump = ddt :get, '1234567890' x 8, title => 't:', color => False, width => 20, does => (DDTR::AsciiGlyphs,) ;
is $dump.lines.elems, 6, '6 lines, width set to 20' or diag $dump ;
is all($dump.lines>>.chars) <= 20,  True, 'all lines under 20 chars' or do { diag $dump.lines>>.chars ;diag $dump ; }

$dump = ddt :get, ['1234567890' x 8], title => 't:', color => False, width => 22, does => (DDTR::AsciiGlyphs,) ;
is $dump.lines.elems, 8, '8 lines, width set to 22' or diag $dump ;
is all($dump.lines>>.chars) <= 22,  True, 'all lines under 22 chars' or do { diag $dump.lines>>.chars ; diag $dump ; }

$dump = ddt :get, '1234567890' x 5, title => '12345' x 5, color => False, width => 22, does => (DDTR::AsciiGlyphs,) ;
is $dump.lines.elems, 6, '6 lines, width set to 20' or diag $dump ;
is all($dump.lines>>.chars) <= 70,  True, 'all lines under 70 chars' or do { diag $dump.lines>>.chars ;diag $dump ; }

$dump = ddt :get, "12345678901234567890\n" x 3, title => '12345' x 5, color => False, width => 15, does => (DDTR::AsciiGlyphs,) ;
is $dump.lines.elems, 9, '9 lines, width set to 15, embedded \n' or diag $dump ;
is all($dump.lines>>.chars) <= 15,  True, 'all lines under 15 chars' or do { diag $dump.lines>>.chars ;diag $dump ; }


