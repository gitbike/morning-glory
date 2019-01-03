class LessonController < ApplicationController
  before_action :set_message, only: :step7

  def step1
    render plain: "こんにちは、#{params[:name]}さん"
  end

  def step2
    render plain: params[:controller] + '#' + params[:action]
  end

  def step3
    redirect_to action: :step4
  end

  def step4
    render plain: 'step3からリダイレクトしました'
  end

  def step5
    flash[:notice] = 'step5から移動しました'
    redirect_to action: :step6
  end

  def step6
    render plain: flash[:notice]
  end

  def step7
    render plain: @message
  end

  def step8
    @price = (2000 * 1.08).floor
  end

  def step9
    @price = 1000
    render 'step8'
  end

  def step10
    @comment = '<script>alert("危険！")</script>こんにちは'
  end

  def step11
    @comment = '<strong>安全なHTML</strong>'
  end

  def step12
    @population = 704414
    @surface = 141.31
  end

  private
  def set_message
    @message = 'こんにちは'
  end
end
