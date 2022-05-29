pragma solidity >=0.7.0 < 0.9.0;

contract myGame{
    
    uint public playerCount = 0;

    mapping(address => Player) public players;

    enum Level {Beginner, Intermediate, Advance}

    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
        uint createdTime;
    }

    function addPlayer(string memory firstName, string memory lastName) public {
        players[msg.sender] = Player(msg.sender, Level.Beginner, firstName, lastName, blockk.timestamp);
        playerCount += 1;
    }
    function getPlayerLevel(address playerAddress) public view returns(Level) {
        Player Storage player = players[playerAddress];
        return players.playerLevel;
    }

    function changePlayerLevel(address playerAddress) public {
        Player Storage player = players[playerAddress];
        if (block.timestamp >= player.createdTime + 20) {
            player.playerLevel = Level.Intermediate;
        }
    }
}
