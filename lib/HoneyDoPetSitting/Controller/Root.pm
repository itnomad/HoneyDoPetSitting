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
#    $c->response->body("This is the 'About' page" );
    $c->response->body("
 The idea behind HoneyDoPetSitting is that during the time I am house or pet sitting while you are out of town I'll take care of the list of minor repairs, painting, organizing, cleaning that you don't have time to do yourself. Have a garage that's a mess? I'll build shelving or install other storage and organize your belongings. Have a bedroom that needs painting? Got it. Rotten fencing, siding, other repairs; I can do that. Simple door or window adjustments or complete refurbishing, I'm expert at that.
My house sitting rates are reasonable. I take in the mail and news papers, take out the trash, water the plants, keep the place clean and operating smoothly. My pet sitting rates are comparable with the rates charged by local kennels. Plus your pets stay in their homes. They get playtime, exercise, grooming, and attention. I treat them like my own. There is no interruption in their normal feeding or medication requirements. I take care of cats, dogs, fish, and outside animals like chickens, goats, and rabbits.
If you don't have a honeydo list, I will continue my normal work schedule. This is usually 5 to 8 hours away from the house while caring for your animals. I also do web development and programming so there may be times when I am working on one of those projects from your kitchen table.
I started working on this website during the summer of 2013. I have experience in the building trades going back to 1976. I have been an enthusiastic pet owner most of my life. I have taken care of the houses and animals of friends and family for fun or profit since the early 2000's. ");
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
