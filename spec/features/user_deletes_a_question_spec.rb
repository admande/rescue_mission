require 'rails_helper'

feature "deletes a question" do
 scenario "user deletes a question from the show page" do
   question = Question.create(name: "What am I doing with my life that has led me to this point? Crowdsourcing various ideas", description: "This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.")

   visit questions_path
   click_link('What am I doing with my life that has led me to this point? Crowdsourcing various ideas')
   click_link('Delete this Question')
   expect(page).to have_no_content("What am I doing with my life that has led me to this point? Crowdsourcing various ideas")
 end

 scenario "user deletes a question from the edit page" do
   question = Question.create(name: "What am I doing with my life that has led me to this point? Crowdsourcing various ideas", description: "This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.")

   visit questions_path
   click_link('What am I doing with my life that has led me to this point? Crowdsourcing various ideas')
   click_link('Edit this Question')
   click_link('Delete this Question')
   expect(page).to have_no_content("What am I doing with my life that has led me to this point? Crowdsourcing various ideas")
 end
end
