module Hangman
  module Dictionary
    # WORDS = %w{
    #   banana avocado apple chocolate froyo peanut
    # array =IO.readlines("linuxwords", chomp: true).split
    # }

    array = File.readlines(File.join(__dir__, 'linuxwords.txt'), chomp: true).split

    WORDS = array

    puts WORDS

    def self.random
      WORDS.sample
    end
  end
end
