package Leak::Model::LeakModel;
use Moose;
use namespace::autoclean;
use Scalar::Util qw/weaken/;

extends 'Catalyst::Model';
with 'Catalyst::Component::InstancePerContext';

has 'context' => (is => 'ro');

sub build_per_context_instance {
  my ($self, $c, @args) = @_;
  # return $self->new({ context => weaken($c), %$self, @args }); # fixes leak
	return $self->new({ context => $c, %$self, @args }); # exhibits leak
}

sub val {
	my ($self) = @_;
	return 'ACGT'x1000000;
}

=head1 NAME

Leak::Model::LeakModel - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.


=encoding utf8

=head1 AUTHOR

Andrew Yates

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
