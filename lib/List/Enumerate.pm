package List::Enumerate;

#-------------------------------------------------------------------------------
#   Module  : List::Enumerate
#
#   Purpose : Provide List Enumeration
#-------------------------------------------------------------------------------

use strict;
use warnings;
use Exporter;

our $VERSION = '0.003';
our @ISA     = qw(Exporter);
our @EXPORT  = qw(enumerate);

#-------------------------------------------------------------------------------
#   Call the run method if the module was called as a script
#-------------------------------------------------------------------------------
__PACKAGE__->run unless caller();

#-------------------------------------------------------------------------------
#   Constructor
#
#   Object constructor parameters are passed directly to the object
#-------------------------------------------------------------------------------
sub new {
   my $class = shift;
   return bless [@_], $class;
}

#-------------------------------------------------------------------------------
#   Subroutine : index
#
#   Output     : The index position in relation to original enumerate list
#-------------------------------------------------------------------------------
sub index { return $_[0]->[0] }

#-------------------------------------------------------------------------------
#   Subroutine : item
#
#   Output     : The item, as per the original enumerate list
#-------------------------------------------------------------------------------
sub item { return $_[0]->[1] }

#-------------------------------------------------------------------------------
#   Subroutine : enumerate
#
#   Input      : list
#
#   Output     : list of List::Enumerate objects
#-------------------------------------------------------------------------------
sub enumerate {
   my $count = 0;
   my @list;
   for my $entry (@_) {
      push @list, List::Enumerate->new( $count, $entry );
      $count++;
   }
   return @list;
}

#-------------------------------------------------------------------------------
#   Subroutine : run
#
#   Purpose    : Testing subroutine
#-------------------------------------------------------------------------------
sub run {

   # Basic List
   my @list = qw(Larry Moe Curly);

   # With enumerate
   for my $enum ( enumerate(@list) ) {
      print $enum->index, " ", $enum->item, "\n";
   }

   # Without enumerate
   my $count = 0;
   for my $entry (@list) {
      print $count, " ", $entry, "\n";
      $count++;
   }

}

1;

# ABSTRACT: Provides list enumeration

__END__

=pod

=encoding UTF-8

=head1 NAME

List::Enumerate - Provides list enumeration

=head1 VERSION

version 0.003

=head1 SYNOPSIS

Provides a simple means of list enumeration.

  my @list = qw(Larry Moe Curly);

  for my $enum ( enumerate(@list) ) {
    print $enum->index, " ", $enum->item, "\n";
  }

Instead of

  my @list = qw(Larry Moe Curly);

  my $count = 0;
  for my $entry ( @list ) {
     print $count, " ", $entry, "\n";
     $count++;
  }

=head1 METHODS

=head2 enumerate

Returns a list of List::Enumerate objects when called with a list

=head2 index

List::Enumerate call, returns the index position

=head2 item

List::Enumerate call, returns the item

=head2 new

Constructor for List::Enumerate, used internally

=head2 run

Used for internal testing when package is run as a script

=head1 AUTHOR

James Spurin <spurin@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by James Spurin.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
