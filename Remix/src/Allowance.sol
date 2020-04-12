pragma solidity 0.6.4;

// import the latest Ownable.sol, safemath.sol from OpenZeppelin 
// Ownable.sol is now restored form library : april 2, 2020
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";



contract Allowance is Ownable{
    
    
    using SafeMath for uint;

    
    // 
    event AllowanceChanged(address indexed _forWho, address indexed  _fromWhom, uint _oldAmount, uint _newAmount);
    
     mapping(address => uint) public allowance;
    
    // allows the owner  to give allowance to another account
    function addAllowance(address _who, uint _amount) public onlyOwner{
        emit AllowanceChanged(_who, msg.sender,allowance[_who], _amount);
        allowance[_who] = _amount; 
    }
  
  
    modifier ownerOrAllowed(uint _amount){
        require(allowance[msg.sender] >= _amount,"not owner" );
        _;
    }
    // internal or protected 
    function reduceAllowance(address _who, uint _amount) internal {
        require(allowance[msg.sender] >= _amount," not owner" );
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who].sub(_amount));
        allowance[_who] = allowance[_who].sub(_amount);
    }
    receive() external payable {
    }

}    
 