require 'sinatra'
require 'datamapper'

get '/' do
  @questions = Question.all :order => :id.desc
  @title = "All Questions"
  erb :home
end

# users
get '/hatxi' do
  "Hat xi hoi!!!"
end

get '/form' do
  erb :form
end

post '/form' do
  'form posted!'
end

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/quora.db")
 
class User
  include DataMapper::Resource
  property :id, Serial
  property :email, Text, :required => true
  property :password, Text, :required => true
  property :created_at, DateTime
  property :updated_at, DateTime
end

class Question
  include DataMapper::Resource
  property :id, Serial
  property :user_id, Serial, :required => true
  property :content, Text, :required => true
  property :created_at, DateTime
  property :updated_at, DateTime
end

class Answer
  include DataMapper::Resource
  property :id, Serial
  property :user_id, Serial, :required => true
  property :question_id, Serial, :required => true
  property :content, Text, :required => true
  property :created_at, DateTime
  property :updated_at, DateTime
end
 
DataMapper.finalize.auto_upgrade!
