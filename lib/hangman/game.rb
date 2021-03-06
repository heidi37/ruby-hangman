module Hangman
  class Game
    attr_reader :chances, :word, :wrong_tries, :guess

    def initialize
      @chances = 5
      @wrong_tries = 0
      @guess = ""
      @word = Dictionary.random
      
    end

    trap "SIGINT" do
      Graphics.clear_screen
      puts "Goodbye, cruel world."
      exit 130
    end

    def play
      bad_guesses = []
      Graphics.clear_screen

      while word.length < 5
        @word = Dictionary.random
      end

      puts "Word: '#{word}'"

      puts 'Guess this word: ' + Graphics.obfuscate_word(word, '')
      
      while true

        print "[#{chances - wrong_tries} chances left]: "

        char = gets.chomp
        Graphics.clear_screen

        if word.include? char
          if char == ""
            puts "You must enter a letter. Don't press enter!"
            puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
            placeholder = Graphics.obfuscate_word(word, guess)
          elsif
           guess.include? char
            puts "You already entered '#{char}'. Yes, it is still correct.. 🙄"
            puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
          else
            guess << char
            placeholder = Graphics.obfuscate_word(word, guess)

            puts 'Whoop Whoop!! ' + placeholder
          end

          unless placeholder.include? Graphics::OBFUSCATION_CHAR
            Graphics.clear_screen
            puts Graphics::ALIVE
            sleep 1.1
            Graphics.clear_screen
            puts Graphics::ALIVE2
            sleep 1.3
            Graphics.clear_screen
            puts Graphics::ALIVE3
            puts "\n\nWELL DONE!! YOU SURVIVED"
            break
          end
        
        else
          if char.match?(/[A-Za-z]/)
            
            if bad_guesses.include? char
              puts "You already entered '#{char}'. Yes, it is still incorrect.. 🙄"
            else
              puts "OH NOES! The word doesn't contain '#{char}'"
              @wrong_tries = @wrong_tries + 1
              bad_guesses.push(char);
            end

            if wrong_tries == chances
              puts Graphics::DEAD
              puts "\nARRRRGGGGGGGGGGG YOU LOST! 😭  😵  ☠️"
              break
            else
              puts 'Try another: ' + Graphics.obfuscate_word(word, guess)
            end

          else
            puts "'#{char}' is not a letter... 🙄"
            puts 'Try another: ' + Graphics.obfuscate_word(word, guess)
          end
        end
      end
    end
  end
end
