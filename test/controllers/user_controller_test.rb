require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  def create_user
    @user = User.new(
      username: 'leandro',
      email: 'leandro@gmail.com',
      password: '12345'
    )
    @user.save

    response = User.where(username: 'leandro').first

    return response
  end

  test "it shoudl return success" do
    get '/user'
    assert_response 200
  end

  test "it should return an user" do
    user = create_user

    get "/user/#{user.id}"
    assert_response 200
  end

  test "it should create an user" do
    post '/user',
    params: {
      user: {
        username: 'leandro',
        email: 'leandro@gmail.com',
        password: '12345'  
      } 
    }

    assert_response 201
  end

  test "it should update an user" do
    user = create_user

    put "/user/#{user.id}",
    params: {
      user: {
        username: 'léia'
      }
    }

    assert_response 201
  end

  test 'it should delete an user' do 
    user = create_user

    delete "/user/#{user.id}"
    assert_response 204
  end
end
