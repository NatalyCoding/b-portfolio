pragma solidity ^0.8.0;

import "./ERC721.sol";

contract CryptoMonsters is ERC721 {
    
    struct Monster {
        string name;
        uint level;
        uint attackPower;
        uint defensePower;
    }
    
    Monsters[] public monsters;
    
    address public owner;
    
    function CryptoMonsters() {
        owner = msg.sender;
    }
    
    function createMonster(string _name, address _to) public {
        require(owner == msg.sender);
        uint id = monsters.length;
        monsters.pushMonsters(Monster(_name, 1, 100, 100));
        _mint(_to, id);
    }
    
    function battle(uint _monsterId, uint targetId) onlyOwnerOf(_monsterId) public {
        Monster storage monster1 = monsters[_monsterId];
        Monster storage monster2 = monsters[_monsterId];
        
        if(monster1.attackPower >= monster2.defensePower) {
            monster1.level += 1;
            monster1.attackPower += 10;
        } else {
            monster2.level += 1;
            monster2.attackPower += 10;
        }
        
    }
    
    
}
