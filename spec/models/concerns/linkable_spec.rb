# frozen_string_literal: true

require 'rails_helper'

shared_examples 'linkable' do
  it { should have_many(:links).dependent(:destroy) }

  it { should accept_nested_attributes_for :links }
end
