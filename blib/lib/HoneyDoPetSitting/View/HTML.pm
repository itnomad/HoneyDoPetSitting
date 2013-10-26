package HoneyDoPetSitting::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
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
