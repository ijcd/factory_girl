require 'spec_helper'

require 'factory_girl/syntax/make'

describe "a factory using make syntax" do
  before do
    define_model('User', :first_name => :string, :last_name => :string)

    FactoryGirl.define do
      factory :user do
        first_name 'Bill'
        last_name  'Nye'
      end
    end
  end

  describe "after make" do
    before do
      @instance = User.make(:last_name => 'Rye')
    end

    it "uses attributes from the factory" do
      @instance.first_name.should == 'Bill'
    end

    it "uses attributes passed to make" do
      @instance.last_name.should == 'Rye'
    end

    it "builds the record" do
      @instance.should be_new_record
    end
  end

  describe "after make!" do
    before do
      @instance = User.make!(:last_name => 'Rye')
    end

    it "uses attributes from the factory" do
      @instance.first_name.should == 'Bill'
    end

    it "uses attributes passed to make" do
      @instance.last_name.should == 'Rye'
    end

    it "saves the record" do
      @instance.should_not be_new_record
    end
  end
end
