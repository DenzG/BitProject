pragma solidity 0.6.4;

// enable to start/destroy or puase a contract
// before all funds can be withdrawn or returned
contract StartStopUpdateExample{
    
    address owner; // contract initiator
    
    bool public paused; // pause a contract with defualt value = false
    
    //assign address to a initialized contract
    constructor() public{
        owner = msg.sender; // initiator of contract
    }
    
    // an address that allow to send ether to a choosen address // in remix
    function sendMoney() public payable{
    }
    
    function setPause(bool _paused) public {
        require(msg.sender == owner, "operation paused: your are not the owner");
        require(paused, "contract is paused");
        paused = _paused;
    }
    
    //transfer all funds to a specefied address
    function withDrawAllMoney(address payable _to) public  {
        require(msg.sender == owner, "your are not the owner");
        _to.transfer(address(this).balance);
    }
    
    // destroy smart contract and release the remainig funds to owner
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "destroy contract operation: You are not the owner");
        selfdestruct(_to);
    }
}