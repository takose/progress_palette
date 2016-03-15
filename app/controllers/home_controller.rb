#require 'phantomjs'

class HomeController < ApplicationController
  def top
    if current_user
      @member = Member.where(user_id:current_user.id)
    end
  end
end
