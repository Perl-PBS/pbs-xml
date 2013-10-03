package PBS::Util::XML;

use PBS::Setup::Exporter;

our @EXPORT_OK = qw( exml );

func exml ($text) {
  $text =~ s/&/&amp;/go;
  $text =~ s/</&lt;/go;
  $text =~ s/>/&gt;/go;
  $text =~ s/'/&apos;/go;
  $text =~ s/"/&quot;/go;

  return $text;
}

1;
