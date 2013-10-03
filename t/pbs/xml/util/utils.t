#!perl

use PBS::Setup::Tests ':std';

use_ok('PBS::Util::XML', qw( exml ));

is(
  exml(q{<'a'&"b"> & <'a'&"b">}),
  '&lt;&apos;a&apos;&amp;&quot;b&quot;&gt; &amp; &lt;&apos;a&apos;&amp;&quot;b&quot;&gt;',
  'XML escape exml() works'
);


done_testing();
