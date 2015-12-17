require 'rails_helper'

feature "sees questions" do
 scenario "see all the questions" do
   question = Question.create(name: "What am I doing with my life that has led me to this point? Crowdsourcing various ideas", description: "This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.")
   another_question = Question.create(name: "What's going on?", description: "Everything")

   visit questions_path
   click_link('What am I doing with my life that has led me to this point? Crowdsourcing various ideas')
   expect(page).to have_content(question.name)
   expect(page).to have_content(question.description)
 end
end
