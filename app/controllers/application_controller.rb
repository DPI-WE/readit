class ApplicationController < ActionController::Base
  skip_forgery_protection

  include Punditable, Trackable
end
