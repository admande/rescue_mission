require 'rails_helper'

feature "sees answer form" do
 scenario "post an answer" do
   question = Question.create(name: "What am I doing with my life that has led me to this point? Crowdsourcing various ideas", description: "This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.")

   visit questions_path
   click_link('What am I doing with my life that has led me to this point? Crowdsourcing various ideas')

   fill_in('Description', :with => 'This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long answer so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.')
   click_button('Create Answer')

   expect(page).to have_content("This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long answer so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.")
   expect(page).to have_content("Answer was successfully created.")
 end

 scenario "cannot post answer less than 50 characters, rerender form with that content" do
   question = Question.create(name: "What am I doing with my life that has led me to this point? Crowdsourcing various ideas", description: "This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.")

   visit questions_path
   click_link('What am I doing with my life that has led me to this point? Crowdsourcing various ideas')

   fill_in('Description', :with => 'Capybara')
   click_button('Create Answer')
   expect(page).to have_content("Capybara")
   expect(page).to have_content("Description is too short")
   expect(page).to have_content("Answer was not created")
 end
end
