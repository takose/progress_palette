module Api
  class MembersController < ApplicationController

    def index
      @member = Member.all
      render json: @member
    end
  end

end