module Hangman
  module Dictionary
    # WORDS = %w{
    #   banana avocado apple chocolate froyo peanut
    # array =IO.readlines("linuxwords", chomp: true).split
    # }

    WORDS = File.readlines(File.join(__dir__, 'linuxwords.txt'), chomp: true)


    def self.random
      WORDS.sample
    end
  end
end
