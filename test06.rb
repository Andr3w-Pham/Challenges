# Exercise 5 - Hard
# Make a rock-paper-scissors game.
# - Prompt the user to make a choice between rock, paper, or scissors.
# - If their input isn't valid, tell them and restart.
# - If their input is valid, tell them, randomly pick a rock-paper-etc option.
# - Using RPS match-up rules, tell the user who the winner is.
# --- Rock beats scissors.
# --- Scissors beats paper.
# --- Paper beats rock.
# HINT: You will need to google for random selection, but everything else should be from class already. Switch Cases, if/else, etc etc.


system('clear')
sleep(0.1)
# Boots up and starts with this prompt
puts "\n Game Rules:
\n--- Rock beats Scissors.
\n--- Scissors beats Paper.
\n--- Paper beats Rock.
"
sleep(4)
puts`clear`


########################################################[ RUBY CONSTANT ]##################################################################
#By convention, most constants are written in all uppercase with underscores to separate words, LIKE_THIS.
# Ruby constants may look like local variables with capital letters, but they have the visibility of global variables: they can be used anywhere in a Ruby program without regard to scope. Unlike global variables, however, constants can be defined by classes and modules and can therefore have qualified names.

# Ruby CONSTANT - OUTCOME
# hash to keep track of the score for both cpu and user
OUTCOME  = {:user => 0, :cpu => 0, :draw => 0}


# Ruby CONSTANT - GROUP
# Grouping 3 hashes together
GROUP = {
  :r => { :Rock => :tie, :Paper => :lose, :Scissors => :win },
  :p => { :Paper => :tie, :Rock => :win, :Scissors => :lose },
  :s => { :Scissors => :tie, :Paper => :win, :Rock => :lose },
}

############################################################################################################
def wipe # method for keeping the screen tidy lols
  sleep(1.3)
  puts`clear`
end
############################################################################################################
def loading
  90.upto(100) do |i|
    progress = "." * (i/10)
    print("\r Loading", progress , i)
    sleep(0.1)
  end
end
############################################################################################################
def cpu # method for the computer to choose from the 3 options: rock, paper or scissors
  choice = rand(1..3) # rand(max) → number. Alias of Random::DEFAULT.rand.
  choice == 1 ? :Rock : choice == 2 ? :Paper : :Scissors # 1 is rock , 2 is paper else its scissors
end
############################################################################################################
def tally(result) # method for keeping track of all results (win,lose and draw)
  if result == :win 
    puts "
    ╔═══▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬══╗

         VICTORY!  ԅ(≖‿≖ԅ)
            
    ╚════════▬▬▬▬▬▬▬▬▬▬═══╝
          "
    OUTCOME[:user] += 1 # Plus 1 to user key if the result is a victory
  elsif result == :lose
    puts "
    ╔═══▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬══╗

          DEFEAT!  (－‸ლ)
    
    ╚════════▬▬▬▬▬▬▬▬▬▬═══╝
          "
    OUTCOME[:cpu] += 1 # Plus 2 to cpu key if the result is a defeat
  else
    puts "
    ╔═══▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬══╗

       ༼つಠ益ಠ༽つ✧  DRAW!

    ╚════════▬▬▬▬▬▬▬▬▬▬═══╝
          "
    OUTCOME[:draw] += 1 # Plus 1 to draw key if the result is a draw
  end
end
############################################################################################################
# Start of the sweet code @_@
require 'io/console' # This gem is a default gem. Call require "io/console" to use this library
def start # method name of starting the game
  wipe
  puts "
  ╔═══▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬════╗

      Let's Play a Game  ٩( ๑╹ ꇴ╹)۶ 

  ╚════════▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬════╝
        "

    options_loop = true
    while options_loop
    puts "Enter your choice: \n1 - Rock \n2 - Paper \n3 - Scissors"

    # cpu randoms an option (rock,paper or scissor)
    ai_choice = cpu
    # STDIN read user's input 
    user_input = STDIN.noecho(&:gets).chomp  # STDIN.noecho(&:gets).chomp - wait for users input and does not display entered input
      case user_input
        when '1'
          wipe
          puts "You Chose Rock"
          options_loop = false
          wipe
          # cpu's turn
          loading
          wipe
          puts "CPU Chose #{ai_choice}"
          wipe
          tally(GROUP[:r][ai_choice])
        when '2'
          puts "You Chose Paper"
          options_loop = false
          wipe
          # cpu's turn
          loading
          wipe
          puts "CPU Chose  #{ai_choice}"
          wipe
          tally(GROUP[:p][ai_choice])
        when '3'
          puts "You Chose Scissors"
          options_loop = false
          wipe
          # cpu's turn
          loading
          wipe
          puts "CPU Chose #{ai_choice}"
          wipe
          tally(GROUP[:s][ai_choice])
        else
          puts ""
          puts 'Invalid Input'
          wipe
        end
    end
    
    wipe
    continue_loop = true
    while continue_loop
    puts "Continue Playing?"
    puts "\n 1 - Yes    ٩( ๑╹ ꇴ╹)۶"
    puts ""
    puts "\n 2 - No      ( ╥﹏╥)"
    continue = STDIN.noecho(&:gets).chomp # STDIN.noecho(&:gets).chomp - wait for users input and does not display entered input
    wipe

        if continue == "1" # if the variable continue is the same as "1" we call the method start to continue our game
          wipe
          start
          wipe
          continue_loop = false
        elsif continue == "2" # when 2 is chosen we display the results and exit the game
          wipe
          puts "\n Your Score is #{OUTCOME[:user]} ԅ(≖‿≖ԅ)" # calling hash outcome for user key and displays score
          puts "\n CPU Score is #{OUTCOME[:cpu]} ( º﹃º  )" # calling hash outcome for cpu key and displays score
          puts "\n Number of draws #{OUTCOME[:draw]} ლ (ಠ益ಠლ)" # # calling hash outcome for draw key and displays score
          puts""
          sleep(4)
          puts`clear`

          90.upto(100) do |i|
            progress = "." * (i/10) unless i < 10
            print("\r Exiting Game   ԅ(≖‿≖ԅ)", progress , i)
            sleep(0.1)
          end
          
          sleep(4)
          puts`clear`
          continue_loop = false
        else 
          puts ""
          puts "Invalid Option (－‸ლ)"
          wipe
        end
    end
end
 ###########################################################################################################
 # end of method called start
wipe
start # method name of starting the game
wipe

