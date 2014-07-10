require 'rails_helper'

RSpec.describe Blog, :type => :model do
  subject { Blog.new }

  it 'has no entries' do
  	expect(subject.entries).to be_empty
  end
  describe '#new_post' do
  	let(:new_post) { OpenStruct.new }

  	before do
  		subject.post_source = ->{ new_post }
  	end

  	it 'accepts an attribute hash on behalf of the post maker' do
  		post_source = double('post')
  		allow(post_source).to receive(:call) { new_post }
  		subject.post_source = post_source
  		subject.new_post(x: 42, y: 'z')
  	end

  	it 'returns a new post' do
  		expect(subject.new_post).to eq(new_post)
  	end

  	it 'sets the posts blog reference to it self' do
  		expect(subject.new_post.blog).to eq(subject)
  	end
  end

  describe '#add_entry' do
  	it 'adds the entry to the blog' do
  		entry = Object.new
  		subject.add_entry(entry)
  		expect(subject.entries).to include(entry)
  	end
  end
end
