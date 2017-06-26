class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # 英単語
  
   def word(selecter, number, grade, doc)
      doc.css(selecter).each_with_index do |doc, i|
          if i != 0
              @en_word = EnWord.new
              # 英単語
            puts @en_word[:name] = doc.inner_text
            puts @en_word[:number] = "#{number}" + i.to_s
            puts @en_word[:grade] = "#{grade}"
            @en_word.save!
        end
      end
   end
   
  # 意味
  def meaning(selecter, number, grade, doc)
      doc.css(selecter).each_with_index do |doc, i|
              i += 1
              puts @en_word = EnWord.find_by(number: "#{number}" + i.to_s, grade: "#{grade}")
              # 意味
            puts @en_word[:meaning] = doc.inner_text
            @en_word.save!
      end
  end
  
end
