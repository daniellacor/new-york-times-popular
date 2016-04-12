require "pry"

require_relative "get-data.rb"

def welcome
  puts "\nHello, and welcome to the New York Times Most Popular!"
end

def navigation
  puts "\nNAVIGATION:"
  op1 = "(1) Keyword search (e.g. 'pigeons')"
  op2 = "(2) View top 10 most viewed articles"
  op3 = "(3) Get lucky: search for a random article, with a twist!"
  op4 = "(4) For those who think the world is going to end"
  op5 = "(5) Help"
  op6 = "(6) Exit\n"
  puts op1, op2, op3, op4, op5
  "navigation"
end

def runExit
  puts "\nSorry to see you go. Thanks for visiting!"
  nil
end

def getAnswer
  puts "\nENTER YOUR CHOICE:"
  puts "(Please enter your choice by line number, e.g. '1')"
  answer = gets.to_i
  if answer == 1
    "keyword"
  elsif answer == 2
    "get10"
  elsif answer == 3
    "getLucky"
  elsif answer == 4
    "self.add_phrase_to_ten"
  elsif answer == 5
    navigation
  elsif answer == 6
    runExit
  else
    puts "\nSorry, that's not a valid command."
    puts "Please enter a number from 1 through 6."
    "enter again"
  end
end
