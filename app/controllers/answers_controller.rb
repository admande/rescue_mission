class AnswersController < ApplicationController
  def show
    @question = Question.find(params[:id])
    # @answer = Answer.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create

    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

      if @answer.save
        redirect_to @question, notice: 'Answer was successfully created.'
      else
        flash.now[:notice] = "Answer was not created"
        render 'questions/show'
      end


  end

  private
  def find_question_id
    params.require()

  end

  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end
end
