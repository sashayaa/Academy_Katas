class Bowling
    # think of some name for max score = 10
    def get_total_score(frames)
        """ Gets the total score for all frames
        Params:
        frames (string): contains all frames separated by space
        Returns:
        score (integer): total score (all frames)
        """
        frames_list = frames.split(" ")
        score = 0
        frames_list.each do |frame|
            if strike?(frame) && frames_list.last != frame
                next_frame = frames_list[frames_list.index(frame) + 1]
                score += 10 + get_score_frame(next_frame)
            elsif spare?(frame) && frames_list.last != frame
                next_frame = frames_list[frames_list.index(frame) + 1]
                score += 10 + score_per_roll(next_frame[0])
            else
                score += get_score_frame(frame)
            end
        end
        score
    end

    private

    def score_per_roll(roll)
        if strike?(roll) 
            score = 10
        else
            score = roll.to_i
        end
        score
    end

    def get_score_frame(frame)
        """ Gets score for only one frame
        Params:
        frame(string): contains only one frame (e.g. number, strike, spare, miss)
        Returns:
        score(integer): the score per one frame individually
        """
        if strike?(frame)
            score = 10
        else
            first_roll = frame[0]  
            second_roll = frame[1]         # Anything else besides digits will be zero: '-'.to_i -> 0
            if second_roll == "/" 
                score = 10
            else
                score = first_roll.to_i + second_roll.to_i
            end
        end
        score 
    end

    def strike?(frame)
        frame == "X"
    end

    def spare?(frame) "4/"
        frame[1] == "/"
    end

end 