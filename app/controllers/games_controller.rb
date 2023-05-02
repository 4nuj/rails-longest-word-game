require 'open-uri'

class GamesController < ApplicationController
  def new
    @string = (0...10).map { (65 + rand(26)).chr }.join
  end

  def score
    # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
    @userlongestword = params[:word]
    result = {}
    url = "https://wagon-dictionary.herokuapp.com/#{@userlongestword.downcase}"
    string_serialized = URI.open(url).read
    string = JSON.parse(string_serialized)
    if string["found"] != true
      @result = "Sorry but #{@userlongestword} doesnt seem to be a valid word"
    else
      @result = "Congratulations!!  #{@userlongestword} is a valid english word"
    end
    @result
  end
end
