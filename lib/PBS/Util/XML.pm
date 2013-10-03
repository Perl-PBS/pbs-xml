package PBS::Util::XML;

use PBS::Setup::Exporter;
use XML::LibXML;
use XML::LibXML::XPathContext;

our @EXPORT_OK = qw( parse_xml_string exml );


func parse_xml_string ($xml, @ns_specs) {
  state $parser = XML::LibXML->new;

  my $doc = $parser->parse_string($xml);
  my $xp  = XML::LibXML::XPathContext->new($doc);

  $xp->registerNs(splice(@ns_specs, 0, 2)) while @ns_specs;

  return $xp;
}

func exml ($text) {
  $text =~ s/&/&amp;/go;
  $text =~ s/</&lt;/go;
  $text =~ s/>/&gt;/go;
  $text =~ s/'/&apos;/go;
  $text =~ s/"/&quot;/go;

  return $text;
}

1;
