pragma solidity ^0.6.4;

// vesting account

// program that allows savings account to be 
// ony withdrawn when it reached its maturity date.
// 
contract Timelock{
    address payable public beneficiary;
    
    uint256 public releaseTime; // use unix timestamp in seconds as the maturity date input format
    
 constructor(
     address payable _benefeciary,
     uint256 _releaseTime
     )
     public payable {
         require(_releaseTime > block.timestamp);
         beneficiary = _benefeciary;
         releaseTime = _releaseTime;
     }
     function release() public{
         require(block.timestamp >= releaseTime,"Account has not reached its maturity");
         beneficiary.transfer(address(this).balance);
     }
     function getBalance() public view returns(uint){
        return address(this).balance;
    } 
}