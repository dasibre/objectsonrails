require 'rails_helper'

RSpec.describe Post, :type => :model do

	subject { Post.new }
    
    it 'supports setting attributes in the initializer' do
    	post = Post.new(title: "mytitle", body: "mybody")
    	expect(post.title).to  eq('mytitle')
    	expect(post.body).to eq('mybody')
    end
	it 'starts with blank attributes' do
		expect(subject.title).to be_nil
		expect(subject.body).to be_nil
	end

	it 'supports reading and wring a title' do
		subject.title = 'Mytitle'
		expect(subject.title).to eq('Mytitle')
	end

	it 'supports reading and wring a title' do
		subject.body = 'Mybody'
		expect(subject.body).to eq('Mybody')
	end

	it 'supports reading and writing a blog reference' do
		blog = Object.new
		subject.blog = blog
		expect(subject.blog).to eq(blog)
	end

	describe '#publish' do
		let(:blog) {double('blog')}

		before do 
			subject.blog = blog
		end

		it 'adds the post to the blog' do
			allow(blog).to receive(:add_entry) {subject}
			subject.publish
		end
	end
end