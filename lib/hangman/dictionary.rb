module Hangman
  module Dictionary

    WORDS = File.readlines(File.join(__dir__, 'linuxwords.txt'), chomp: true)


    def self.random
      WORDS.sample
    end

  end
end
