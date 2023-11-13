class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !@game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    if !@game_over
      show_sequence
      require_sequence

      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    (0...seq.length).each do |i1|
      print 
    end
  end

  def require_sequence
    my_seq = []
    (0...seq.length).each do |i1|
      response = gets.chomp
      if response == seq[i1]
        my_seq << response
      else
        game_over
      end
    end
  end

  def add_random_color
    colors = ["red", "blue", "yellow", "green"]
    i1 = rand(0...colors.length)
    @seq << colors[i1]
  end

  def round_success_message
    print "round success"
  end

  def game_over_message
    print "game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end