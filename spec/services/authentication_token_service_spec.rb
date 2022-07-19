require 'rails_helper'

describe AuthenticationTokenService do
  let(:token) { described_class.call }
  
  describe '.call' do
    it 'returns an authentication token' do
      decoded_token = JWT.decode(
        token,
        described_class::HMAC_SECRET, 
        true, 
        { algorithm: described_class::ALGORITHM_TYPE }
        )

      expect(decoded_token).to eq(
        [
          {"test"=>"test"},
          {"alg"=>"HS256"} 
        ]
      )
    end
  end
end