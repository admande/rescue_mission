require 'rails_helper'

feature "edits a new question" do
  scenario "posts a valid question and edits it" do
    visit new_question_path
    fill_in('Name', :with => 'What am I doing with my life that has led me to this point? Crowdsourcing various ideas')
    fill_in('Description', :with => 'This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.')
    click_button('Create Question')
    click_link('Edit this Question')

    expect(page).to have_content("Edit Question right hurr")
    fill_in('Name', :with => 'What what in the arm am I doing with my life that has led me to this point? Crowdsourcing various ideas')
    fill_in('Description', :with => 'Thiss quesiton is NOT meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.')
    click_button('Update Question')

    expect(page).to have_content('What what in the arm am I doing with my life that has led me to this point? Crowdsourcing various ideas')
    expect(page).to have_content('Thiss quesiton is NOT meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.')

    visit questions_path
    expect(page).to have_content('What what in the arm am I doing with my life that has led me to this point? Crowdsourcing various ideas')
  end

  scenario "posts a valid question and edits it invalidly" do
    visit new_question_path
    fill_in('Name', :with => 'What am I doing with my life that has led me to this point? Crowdsourcing various ideas')
    fill_in('Description', :with => 'This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.')
    click_button('Create Question')
    click_link('Edit this Question')

    expect(page).to have_content("Edit Question right hurr")
    fill_in('Name', :with => '')
    fill_in('Description', :with => '')
    click_button('Update Question')

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Name is too short (minimum is 40 characters)")
    expect(page).to have_content("Description is too short (minimum is 150 characters)")

    visit questions_path
    expect(page).to have_content('What am I doing with my life that has led me to this point? Crowdsourcing various ideas')
  end

end
