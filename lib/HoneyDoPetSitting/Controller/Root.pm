package HoneyDoPetSitting::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

HoneyDoPetSitting::Controller::Root - Root Controller for HoneyDoPetSitting

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}

=head2 hello world

Hello World page

=cut

sub hello : Path('hello') {
    my ( $self, $c ) = @_;

    $c->response->body("Hello, World!");
}


sub about : Path('about') {
   my ( $self, $c ) = @_;
    $c->response->body("This is the 'About' page" );
        $c->stash(template => 'about.tt');
}
    
sub gallery : Path('gallery') {
   my ( $self, $c ) = @_;
       $c->response->body("This is the 'Gallery' page" );
}
    
sub contact_info : Path('contact_info') {
   my ( $self, $c ) = @_;
       $c->response->body("This is the 'Registration' page.
       For now it will just
       collect information about the viewer of the web site"
       );
}
    

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Jack Lupton

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
