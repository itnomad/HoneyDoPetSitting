package HoneyDoPetSitting::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    # Change default TT extension
    #TEMPLATE_EXTENSION => '.tt2',
    #set the location for TT files
    INCLUDE_PATH => [
        HoneyDoPetSitting->path_to( 'root', 'src' ),
      ],
    #set to 1 for detailed timer stats in your HTML as comments
    TIMER       => 0,
    # this is your wrapper template located in the 'root/src'
    WRAPPER => 'wrapper.tt2',
);

=head1 NAME

HoneyDoPetSitting::View::HTML - TT View for HoneyDoPetSitting

=head1 DESCRIPTION

TT View for HoneyDoPetSitting.

=head1 SEE ALSO

L<HoneyDoPetSitting>

=head1 AUTHOR

Jack Lupton

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
