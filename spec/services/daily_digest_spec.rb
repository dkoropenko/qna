# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyDigest do
  let(:users) { create_list(:user, 3) }

  it 'sends daily digest to all users' do
    users.each { |user| expect(DailyDigestMailer).to receive(:digest).with(user, questions: []).and_call_original }
    subject.send_digest
  end
end