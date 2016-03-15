class MembersController < ApplicationController
  before_action :logged_in_user, only: [:new]

  def new
    @member = Member.new
  end

  def create
    @member = current_user.members.new(member_params)
#    @member.progress = get_progress(@member)
    if @member.save
      redirect_to root_url
    end
  end

  def edit
    @member=Member.find(params[:id])
  end

  def update
    @member=Member.find(params[:id])
    @member.name=params[:name]
    @member.progress=params[:progress]
    @member.url=params[:url]
    @member.achievement=params[:achievement]
 #   @member.progress = get_progress(@member)
    if @member.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @member=Member.find(params[:id])
    @member.destroy
    redirect_to root_path
  end

  private
     # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def member_params
      params.require(:member).permit(:name, :progress, :url, :achievement)
    end
=begin
    def get_progress(member)
    # URLにアクセスするためのライブラリの読み込み
    require 'open-uri'
    # Nokogiriライブラリの読み込み
    require 'nokogiri'
    require 'net/http'
    require 'uri'

    # スクレイピング先のURL
        url = member.url
        charset = nil
        html = open(url) do |f|
          charset = f.charset # 文字種別を取得
          f.read # htmlを読み込んで変数htmlに渡す
        end
        # htmlをパース(解析)してオブジェクトを生成
        doc = Nokogiri::HTML.parse(html, nil, charset)
        byebug
        doc.css("table").each do |node|
          progress+=node.css('.status-icon')[1].value+","
        end
    end
=end
end
