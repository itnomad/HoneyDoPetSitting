use utf8;
package HoneyDoPetSitting::Schema::Result::Book;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HoneyDoPetSitting::Schema::Result::Book

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::PassphraseColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 TABLE: C<book>

=cut

__PACKAGE__->table("book");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 1

=head2 rating

  data_type: 'integer'
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  is_nullable: 1

=head2 updated

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 1 },
  "rating",
  { data_type => "integer", is_nullable => 1 },
  "created",
  { data_type => "timestamp", is_nullable => 1 },
  "updated",
  { data_type => "timestamp", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 book_authors

Type: has_many

Related object: L<HoneyDoPetSitting::Schema::Result::BookAuthor>

=cut

__PACKAGE__->has_many(
  "book_authors",
  "HoneyDoPetSitting::Schema::Result::BookAuthor",
  { "foreign.book_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 authors

Type: many_to_many

Composing rels: L</book_authors> -> author

=cut

__PACKAGE__->many_to_many("authors", "book_authors", "author");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-08 21:23:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1bwtFIZxLV1mzUuap9nuNw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
#many_to_many():
#   args:
#       1) Name of relationship bridge, DBIC will create accessor with this
#       name
#       2) Name of has_many() relationship this many_to_many() is shortcut for
#       3) Name of belongs_to() relationship in model class of has_many()
#       above
#  You must already have the has_many() defined to use a many_to_many().
#__PACKAGE__->many_to_many(authors => 'book_authors', 'author');
=head2 author_count

Return the number of authors for the current book

=cut

sub author_count {
    my ($self) = @_;
    # Use the 'many_to_many' relationship to fetch all of the authors for the
    # current and the 'count' method in DBIx::Class::ResultSet to get a SQL
    # COUNT
    return $self->authors->count;
}

=head2 author_list

Return a comma-separated list of authors for the current book

=cut

sub author_list {
    my ($self) = @_;
    
    # Loop through all authors for the current book, calling all the
    # 'full_name' Result Class method for each
    my @names;
    foreach my $author ($self->authors) {
        push(@names, $author->full_name);
    }
    return join(', ', @names);
}
=head2 delete_allowed_by

Can the specified user delete the current book?

=cut

sub delete_allowed_by {
    my ($self, $user) = @_;

    # Only allow delete if user has 'admin' role
    return $user->has_role('admin');
}

#
# Enable automatic date handling
#
__PACKAGE__->add_columns(
    "created",
    { data_type => 'timestamp', set_on_create => 1 },
    "updated",
    { data_type => 'timestamp', set_on_create => 1, set_on_update => 1 },
);

__PACKAGE__->meta->make_immutable;
1;
