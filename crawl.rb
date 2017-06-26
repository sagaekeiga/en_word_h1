require 'nokogiri'
require 'open-uri'




##  第一部 ~wikipediaで選手名とリンクを取得~
# 選手名の取得 target wikipedia

    doc = Nokogiri::HTML(open("http://www.eigo-duke.com/tango/kou1.html"))


    doc.css("#_HPB_TABLE_3_C_081023234310").each do |doc|
       doc.css("tbody > tr > td.hpb-cnt-tb-cell3").each do |doc|
           puts doc.inner_text
       end
        doc.css("tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
            # 意味
          puts doc.inner_text
        end
    end
    
    # ## 動詞
    # doc.css("#_HPB_TABLE_3_C_081023234310 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
    #     # 英単語
    #   puts doc.inner_text
    #   puts i
    # end

    # doc.css("#_HPB_TABLE_3_C_081023234310 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
    #     # 意味
    #   puts doc.inner_text
    #   puts i
    # end



    # ## 名詞
    # doc.css("#_HPB_TABLE_3_C_081023234440 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
    #     # 英単語
    #   puts doc.inner_text
    #   puts i
    # end
    
    # doc.css("#_HPB_TABLE_3_C_081023234440 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
    #     # 意味
    #   puts doc.inner_text
    #   puts i
    # end
    
    # ## 形容詞
    # doc.css("#_HPB_TABLE_3_C_081023234530 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
    #     # 英単語
    #   puts doc.inner_text
    #   puts i
    # end
    
    # doc.css("#_HPB_TABLE_3_C_081023234530 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
    #     # 意味
    #   puts doc.inner_text
    #   puts i
    # end
    
    
    # ## 副詞
    # doc.css("#_HPB_TABLE_3_C_081023234619 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
    #     # 英単語
    #   puts doc.inner_text
    #   puts i
    # end
    
    # doc.css("#_HPB_TABLE_3_C_081023234619 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
    #     # 意味
    #   puts doc.inner_text
    #   puts i
    # end
    
    
    # ## 前置詞・接続詞
    # doc.css("#_HPB_TABLE_3_C_081023234654 > tbody > tr > td.hpb-cnt-tb-cell3").each_with_index do |doc, i|
    #     # 英単語
    #   puts doc.inner_text
    #   puts i
    # end
    
    # doc.css("#_HPB_TABLE_3_C_081023234654 > tbody > tr > td.hpb-cnt-tb-cell4").each_with_index do |doc, i|
    #     # 意味
    #   puts doc.inner_text
    #   puts i
    # end