require 'sinatra'

class PersonalDetailsApp < Sinatra::Base

  get '/' do
    erb :name
  end

  post '/name' do
    name = params[:name_input]
    redirect '/age?name=' + name
  end

  get '/age' do
    name = params[:name]
    erb :age, locals: {name: name}
  end

  post '/age' do
    name = params[:name_input]
    age = params[:age_input]
    #{age}&{name}" - this will show you the values of age and name, must use double quote
    redirect '/favnums?age=' + age + '&name=' + name
  end

  get '/favnums' do
    name = params[:name]
    age = params[:age]
    erb :favnums, locals: {name: name, age: age}
    #{name} and #{age}"  # shows the value of name and age
  end

  post '/favnums' do
    name = params[:name_input]
    age = params[:age_input].to_i
    fav_num1 = params[:fav_num1_input].to_i
    fav_num2 = params[:fav_num2_input].to_i
    fav_num3 = params[:fav_num3_input].to_i
    sum = (fav_num1 + fav_num2 + fav_num3)

    results = 'less than'
      if (sum > age)
        results = 'greater than'
      elsif (sum == age)
        results = 'equal to'
      else
        results
      end

  erb :results, :locals => {name: name, age: age, fav_num1: fav_num1, fav_num2: fav_num2, fav_num3: fav_num3, :sum => sum, :results => results}   
  end
end

