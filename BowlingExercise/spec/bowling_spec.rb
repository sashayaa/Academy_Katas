require_relative '../bowling'

describe Bowling do
    bowling = Bowling.new
    it "adds two rolls together" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("45")

        # Assert
        expect(result).to eq(9)
    end

    it "adds two other rolls together" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("32")

        # Assert
        expect(result).to eq(5)
    end

    it "adds a roll and a miss" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("9-")   

        # Assert
        expect(result).to eq(9)
    end

    it "adds a roll and a spare" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("5/")      

        # Assert
        expect(result).to eq(10)
    end

    it "adds a strike" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("X")      

        # Assert
        expect(result).to eq(10)
    end

    it "adds two frames with first one being a number" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("45 32")      

        # Assert
        expect(result).to eq(14)
    end

    it "adds two frames with first one strike and second number" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("X 45")      

        # Assert
        expect(result).to eq(28)
    end

    it "adds two frames with one spare and a number" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("5/ 45")      

        # Assert
        expect(result).to eq(23)
    end

    it "adds four frames spare-strike-number-miss" do
        # Arrange
        # bowling = described_class.new

        # Act
        result = bowling.get_total_score("5/ X 45 9-")      

        # Assert
        expect(result).to eq(57)
    end

    
end 

# Cases that will definitely work
# "45 32"
# "45 9-"
# "45 X"
# "45 5/"

# Complex cases that we already handled
# "X X" *
# "X 45" *
# "X 5/" *
# "X 9-" *

# Complex cases that we didn't yet handle
# "5/ 9-" *
# "5/ 5/" *
# or more than 2 frames at a time