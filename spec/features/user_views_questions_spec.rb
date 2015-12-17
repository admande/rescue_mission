require 'rails_helper'

feature "sees questions" do
 scenario "see all the questions" do
   question = Question.create(name: "What am I doing with my life that has led me to this point? Crowdsourcing various ideas", description: "This quesiton is not meant to seem so bleak but I really need to fill out a very long question and a correspondingly long description so that my rspec tests pass. I guess that could be something you would see in a question queue, but really it is just me blabbering on and on and on and on and on.")
   another_question = Question.create(name: "What is the deal with paperclips? They are not paper, they are not clips. Oh wait, they are clips.", description: "Gosh, I am really sorry about that question. I clearly did not think it through very thoroughly. Of course they are clips, I think anyone can see that. But maybe the word paperclip is a bit long? No, I guess it is a good description of how it works and what it does. I mean, maybe we could shorten it to pclip?")

   visit questions_path
   expect(page).to have_content(question.name)
   expect(page).to have_content(another_question.name)

   old_question_position = page.body.index("What am I doing")
   new_question_position = page.body.index("What is the deal with paperclips?")
   expect(old_question_position).to be > new_question_position
 end
end
