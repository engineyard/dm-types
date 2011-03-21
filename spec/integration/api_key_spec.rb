require 'spec_helper'

try_spec do
  require './spec/fixtures/api_user'

  describe DataMapper::TypesFixtures::APIUser do
    supported_by :all do
      before :all do
        @resource = DataMapper::TypesFixtures::APIUser.new(:name => 'alice')
        @original_api_key = @resource.api_key
      end

      it "should have a default value" do
        @original_api_key.should_not be_nil
      end

      it "should preserve the default value" do
        @resource.api_key.should == @original_api_key
      end

      it "should generate unique API Keys for each resource" do
        other_resource = DataMapper::TypesFixtures::APIUser.new(:name => 'eve')

        other_resource.api_key.should_not == @original_api_key
      end
    end
  end
end