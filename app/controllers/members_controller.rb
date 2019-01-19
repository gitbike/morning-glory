class MembersController < ApplicationController
  def index
    @members = Member.active.order('number')
  end

  # 会員情報の詳細
  def show
    @member = Member.active.find(params[:id])
  end

  def new
    @member = Member.active.new(birthday: Date.new(1980, 1, 1))
  end

  def edit
    @member = Member.active.find(params[:id])
  end

  def create
    @member = Member.active.new(params[:member])
    if @member.save
      redirect_to @member, notice: '会員を登録しました'
    else
      render 'new'
    end
  end

  def update
    @member = Member.active.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to @member, notice: '会員情報を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @member = Member.active.find(params[:id])
    @member.destroy
    redirect_to :members, notice: '会員を削除しました'
  end

  def search
    @members = Member.active.search(params[:q])
    render 'index'
  end
end
