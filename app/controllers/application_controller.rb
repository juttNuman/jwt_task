class ApplicationController < ActionController::Base
include JsonWebToken
before_action :authenticate_request
protect_from_forgery with: :null_session, if: -> { request.format.json? }

# include JsonWebToken
private
def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decode = jwt_decode(header) 
    @current_user = User.find(decode[:user_id])
  end

end
