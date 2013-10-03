#!perl

use PBS::Setup::Tests ':std';

use_ok('PBS::Util::XML', qw( parse_xml_string exml ));

is(
  exml(q{<'a'&"b"> & <'a'&"b">}),
  '&lt;&apos;a&apos;&amp;&quot;b&quot;&gt; &amp; &lt;&apos;a&apos;&amp;&quot;b&quot;&gt;',
  'XML escape exml() works'
);

subtest 'parse_xml_string' => sub {
  my $xp1 = parse_xml_string('<a><b>hello!</b></a>');
  is($xp1->findvalue('//b'), 'hello!', 'parse_xml() returns a XPath-ready XML object');

  my $xp2 = parse_xml_string('<a xmlns:d="mine_me"><d:b>hello!</d:b><b>other</b></a>', ns1 => 'mine_me');
  is($xp2->findvalue('//ns1:b'), 'hello!', 'parse_xml_string() can use namespaces');

  my $xp3 = parse_xml_string('<a xmlns:d="mine_you"><d:b>yellow!</d:b><b>hello!</b></a>', ns1 => 'mine_you');
  is($xp3->findvalue('//ns1:b'), 'yellow!', 'parse_xml_string() can reuse NS prefixes, no problem');
};


done_testing();
