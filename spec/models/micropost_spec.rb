require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before { @micropost = user.microposts.build(content: "Lorem ipsum") }
	
  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
  	before { @micropost.content = " " }
  	it { should_not be_valid }
  end

  describe "with content that is too long" do
  	before { @micropost.content = "a" * 141 }
  	it { should_not be_valid }
  end

  describe 'today scope' do
    it 'should not include posts from yesterday' do
      old_post = Micropost.create(created_at: Date.yesterday.beginning_of_day, content: 'Hello', user_id: 1)
      new_post = Micropost.create(content: 'Oh Hey', user_id: 2, created_at: Date.today)
      future_post = Micropost.create(content: 'Oh Hey', user_id: 2, created_at: Date.tomorrow)
      Micropost.all.should include old_post
      Micropost.all.should include new_post
      MicropostQuery.new(user.microposts).today.new(user.microposts).should include new_post
      MicropostQuery.new(user.microposts).today.should_not include old_post
      MicropostQuery.new(user.microposts).today.should_not include future_post
    end
  end
end
