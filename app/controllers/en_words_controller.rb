class EnWordsController < ApplicationController
    http_basic_authenticate_with name: "sagae", password: "s19930528"

    require 'nokogiri'
    require 'open-uri'

    def index
      @en_words = EnWord.all
      @q        = EnWord.search(params[:q])
      @results = @q.result(distinct: true)
    end
    
    def new
        @en_word = EnWord.new
    end
    
    def create
     @en_word = EnWord.new(en_word_params)
     if @en_word.save
       redirect_to root_path
     else
       render 'en_words/new'
     end
    end
    
    def edit
      @en_word = EnWord.find(params[:id])
    end
    
    def destroy
      @en_word = EnWord.find(params[:id])
        if @en_word.delete
         flash[:success] = "deleted"
        end
        redirect_to root_path
    end
    
    def show
      @en_word = EnWord.find(params[:id])
    end
    
    def update
        @en_word = EnWord.find(params[:id])
        @en_word.update(en_word_params)
        redirect_to root_path
    end
    
    def word_h1
        doc = Nokogiri::HTML(open("http://www.eigo-duke.com/tango/kou1.html"))

        @en_words = EnWord.where(grade: "h1")

        if @en_words.blank?
        
            ## 動詞
            doc.css("#_HPB_TABLE_3_C_081023234310 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "v" + i.to_s
                  puts @en_word[:grade] = "h1"
                  @en_word.save!
              end
            end
        
            doc.css("#_HPB_TABLE_3_C_081023234310 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "v" + i.to_s, grade: "h1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
        
        
        
            ## 名詞
            doc.css("#_HPB_TABLE_3_C_081023234440 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "n" + i.to_s
                  puts @en_word[:grade] = "h1"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023234440 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "n" + i.to_s, grade: "h1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            ## 形容詞
            doc.css("#_HPB_TABLE_3_C_081023234530 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "a" + i.to_s
                  puts @en_word[:grade] = "h1"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023234530 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "a" + i.to_s, grade: "h1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            ## 副詞
            doc.css("#_HPB_TABLE_3_C_081023234619 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "ad" + i.to_s
                  puts @en_word[:grade] = "h1"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023234619 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "ad" + i.to_s, grade: "h1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            ## 前置詞・接続詞
            doc.css("#_HPB_TABLE_3_C_081023234654 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                   puts @en_word[:name] = doc.inner_text
                   puts @en_word[:number] = "o" + i.to_s
                   puts @en_word[:grade] = "h1"
                   @en_word.save!
               end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023234654 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "o" + i.to_s, grade: "h1")
                    # 意味
                   puts @en_word[:meaning] = doc.inner_text
                   @en_word.save!
            end
        end
    
        redirect_to root_path
    end
    
    
    def word_h2

        doc = Nokogiri::HTML(open("http://www.eigo-duke.com/tango/kou2.html"))

        @en_words = EnWord.where(grade: "h2")

        if @en_words.blank?
            ## 動詞
            doc.css("#_HPB_TABLE_3_C_081023234945 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "v" + i.to_s
                  puts @en_word[:grade] = "h2"
                  @en_word.save!
              end
            end
        
            doc.css("#_HPB_TABLE_3_C_081023234945 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "v" + i.to_s, grade: "h2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
        
        
        
            ## 名詞
            doc.css("#_HPB_TABLE_3_C_081023235147 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "n" + i.to_s
                  puts @en_word[:grade] = "h2"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023235147 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "n" + i.to_s, grade: "h2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            ## 形容詞
            doc.css("#_HPB_TABLE_3_C_081023235257 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "a" + i.to_s
                  puts @en_word[:grade] = "h2"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023235257 > tbody > tr> td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "a" + i.to_s, grade: "h2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            ## 副詞
            doc.css("#_HPB_TABLE_3_C_081023235352 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "ad" + i.to_s
                  puts @en_word[:grade] = "h2"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023235352 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "ad" + i.to_s, grade: "h2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            ## 前置詞・接続詞
            doc.css("#_HPB_TABLE_3_C_081023235439 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "o" + i.to_s
                  puts @en_word[:grade] = "h2"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023235439 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "o" + i.to_s, grade: "h2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
        end
    
        redirect_to root_path
    end
    
    
    def word_h3

        doc = Nokogiri::HTML(open("http://www.eigo-duke.com/tango/kou3.html"))

        @en_words = EnWord.where(grade: "h3")

        if @en_words.blank?
            ## 動詞
            doc.css("#_HPB_TABLE_3_C_081023235654 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "v" + i.to_s
                  puts @en_word[:grade] = "h3"
                  @en_word.save!
              end
            end
        
            doc.css("#_HPB_TABLE_3_C_081023235654 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "v" + i.to_s, grade: "h3")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
        
        
        
            ## 名詞
            doc.css("#_HPB_TABLE_3_C_081023235750 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "n" + i.to_s
                  puts @en_word[:grade] = "h3"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023235750 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "n" + i.to_s, grade: "h3")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            ## 形容詞
            doc.css("#_HPB_TABLE_3_C_081023235849 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "a" + i.to_s
                  puts @en_word[:grade] = "h3"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023235849 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "a" + i.to_s, grade: "h3")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            ## 副詞
            doc.css("#_HPB_TABLE_3_C_081023235957 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "ad" + i.to_s
                  puts @en_word[:grade] = "h3"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081023235957 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "ad" + i.to_s, grade: "h3")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            ## 前置詞・接続詞
            doc.css("#_HPB_TABLE_3_C_081024000105 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "o" + i.to_s
                  puts @en_word[:grade] = "h3"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081024000105 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "o" + i.to_s, grade: "h3")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
        end
    
        redirect_to root_path
    end
    

    def word_j1

        doc = Nokogiri::HTML(open("http://www.eigo-duke.com/tango/chu1.html"))

        @en_words = EnWord.where(grade: "j1")

        if @en_words.blank?
        
            ## 名詞 身の回り
            doc.css("#_HPB_TABLE_3_C_081022000051 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "nn" + i.to_s
                  puts @en_word[:grade] = "j1"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081022000051 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "nn" + i.to_s, grade: "j1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            ## 名詞 場所・建物
            doc.css("#_HPB_TABLE_3_C_081022000245 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "np" + i.to_s
                  puts @en_word[:grade] = "j1"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081022000245 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "np" + i.to_s, grade: "j1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            
            ## 名詞　その他
            doc.css("#_HPB_TABLE_3_C_081022000427 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0 && i != 1
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "no" + i.to_s
                  puts @en_word[:grade] = "j1"
                  @en_word.save!
              end
            end
            
            
            doc.css("#_HPB_TABLE_3_C_081022000427 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 2
                    @en_word = EnWord.find_by(number: "no" + i.to_s, grade: "j1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end            
            
            ## 動詞
            doc.css("#_HPB_TABLE_3_C_081022000554 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "v" + i.to_s
                  puts @en_word[:grade] = "j1"
                  @en_word.save!
              end
            end
        
            doc.css("#_HPB_TABLE_3_C_081022000554 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "v" + i.to_s, grade: "j1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            
            ## 形容詞・副詞
            doc.css("#_HPB_TABLE_3_C_081022000751 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "aad" + i.to_s
                  puts @en_word[:grade] = "j1"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081022000751 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "aad" + i.to_s, grade: "j1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            ## 名詞　数
            doc.css("#_HPB_TABLE_3_C_081022000913 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "nm" + i.to_s
                  puts @en_word[:grade] = "j1"
                  @en_word.save!
              end
            end
            
            
            doc.css("#_HPB_TABLE_3_C_081022000913 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "nm" + i.to_s, grade: "j1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end            
            
            
            ## 代名詞
            doc.css("#_HPB_TABLE_3_C_081022001025 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "p" + i.to_s
                  puts @en_word[:grade] = "j1"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081022001025 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "p" + i.to_s, grade: "j1")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
        end
    
        redirect_to root_path
    end
    
    
    def word_j2

        doc = Nokogiri::HTML(open("http://www.eigo-duke.com/tango/chu2.html"))

        @en_words = EnWord.where(grade: "j2")

        if @en_words.blank?
        
            ## 名詞1
            doc.css("#_HPB_TABLE_3_C_081022001346 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "n1" + i.to_s
                  puts @en_word[:grade] = "j2"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081022001346 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "n1" + i.to_s, grade: "j2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            ## 名詞2
            doc.css("#_HPB_TABLE_3_C_081022001455 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "n2" + i.to_s
                  puts @en_word[:grade] = "j2"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081022001455 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "n2" + i.to_s, grade: "j2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            
            ## 名詞3
            doc.css("#_HPB_TABLE_3_C_081022001558 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "n3" + i.to_s
                  puts @en_word[:grade] = "j2"
                  @en_word.save!
              end
            end
            
            
            doc.css("#_HPB_TABLE_3_C_081022001558 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "n3" + i.to_s, grade: "j2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end            
            
            ## 名詞4
            doc.css("#_HPB_TABLE_3_C_081022071448 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "n4" + i.to_s
                  puts @en_word[:grade] = "j2"
                  @en_word.save!
              end
            end
            
            
            doc.css("#_HPB_TABLE_3_C_081022071448 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "n4" + i.to_s, grade: "j2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end                  
            
            
            ## 名詞5
            doc.css("#_HPB_TABLE_3_C_081022071538 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "n5" + i.to_s
                  puts @en_word[:grade] = "j2"
                  @en_word.save!
              end
            end
            
            
            doc.css("#_HPB_TABLE_3_C_081022071538 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "n5" + i.to_s, grade: "j2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            ## 動詞
            doc.css("#_HPB_TABLE_3_C_081022071630 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "v1" + i.to_s
                  puts @en_word[:grade] = "j2"
                  @en_word.save!
              end
            end
        
            doc.css("#_HPB_TABLE_3_C_081022071630 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "v1" + i.to_s, grade: "j2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            ## 動詞
            doc.css("#_HPB_TABLE_3_C_081022071710 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "v2" + i.to_s
                  puts @en_word[:grade] = "j2"
                  @en_word.save!
              end
            end
        
            doc.css("#_HPB_TABLE_3_C_081022071710 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "v2" + i.to_s, grade: "j2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end
            
            
            
            ## 形容詞
            doc.css("#_HPB_TABLE_3_C_081022071804 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
                if i != 0
                    @en_word = EnWord.new
                    # 英単語
                  puts @en_word[:name] = doc.inner_text
                  puts @en_word[:number] = "a" + i.to_s
                  puts @en_word[:grade] = "j2"
                  @en_word.save!
              end
            end
            
            doc.css("#_HPB_TABLE_3_C_081022071804 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
                    i += 1
                    @en_word = EnWord.find_by(number: "a" + i.to_s, grade: "j2")
                    # 意味
                  puts @en_word[:meaning] = doc.inner_text
                  @en_word.save!
            end

        end
    
        redirect_to root_path
    end
    
    

    def word_j3

        doc = Nokogiri::HTML(open("http://www.eigo-duke.com/tango/chu3.html"))

        @en_words = EnWord.where(grade: "j3")

        if @en_words.blank?
        
            ## 名詞1
            word("#_HPB_TABLE_3_C_081022072146 > tbody > tr > td.hpb-cnt-tb-cell3", "n1", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022072146 > tbody > tr > td.hpb-cnt-tb-cell4", "n1", "j3", doc)


            ## 名詞2
            word("#_HPB_TABLE_3_C_081022072244 > tbody > tr > td.hpb-cnt-tb-cell3", "n2", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022072244 > tbody > tr > td.hpb-cnt-tb-cell4", "n2", "j3", doc)
            
            ## 名詞3
            word("#_HPB_TABLE_3_C_081022072347 > tbody > tr > td.hpb-cnt-tb-cell3", "n3", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022072347 > tbody > tr > td.hpb-cnt-tb-cell4", "n3", "j3", doc)
            
            ## 名詞4
            word("#_HPB_TABLE_3_C_081022072454 > tbody > tr > td.hpb-cnt-tb-cell3", "n4", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022072454 > tbody > tr > td.hpb-cnt-tb-cell4", "n4", "j3", doc)
            
            ## 動詞
            word("#_HPB_TABLE_3_C_081022072549 > tbody > tr > td.hpb-cnt-tb-cell3", "v", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022072549 > tbody > tr > td.hpb-cnt-tb-cell4", "v", "j3", doc)
            
            ## 形容詞
            word("#_HPB_TABLE_3_C_081022072643 > tbody > tr > td.hpb-cnt-tb-cell3", "a", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022072643 > tbody > tr > td.hpb-cnt-tb-cell4", "a", "j3", doc)
            
            ## 序数
            word("#_HPB_TABLE_3_C_081022072730 > tbody > tr > td.hpb-cnt-tb-cell3", "on", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022072730 > tbody > tr > td.hpb-cnt-tb-cell4", "on", "j3", doc)
        
            ## 形容詞・副詞・接続詞・前置詞
            word("#_HPB_TABLE_3_C_081022072915 > tbody > tr > td.hpb-cnt-tb-cell3", "o", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022072915 > tbody > tr > td.hpb-cnt-tb-cell4", "o", "j3", doc)
        
            ## 副詞
            word("#_HPB_TABLE_3_C_081022073110 > tbody > tr > td.hpb-cnt-tb-cell3", "ad", "j3", doc)
            meaning("#_HPB_TABLE_3_C_081022073110 > tbody > tr > td.hpb-cnt-tb-cell4", "ad", "j3", doc)
            
            
        end
    
        redirect_to root_path
    end
    
    
    
    
      private
      
        def en_word_params
          params.require(:en_word).permit(:name, :meaning, :number, :grade)
        end
end
