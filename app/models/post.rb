class Post
  extend ActiveModel::Naming #adds class methods to object
  include ActiveModel::Conversion #adds instance methods to object
  
  attr_accessor :title, :body, :blog
    
  def initialize(attrs={})
    attrs.each {|k,v| send("#{k}=", v)}
  end

  def publish
	blog.add_entry(self)
  end

  def persisted?
	false
  end
end