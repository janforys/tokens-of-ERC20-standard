pragma solidity ^0.4.2;

import "./DappToken.sol";

contract DappTokenSale {
    address admin;
    DappToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;     // Assign an admin
        tokenContract = _tokenContract;     // Token contract
        tokenPrice = _tokenPrice;    // Token price
    }

    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y==0 || (z = x * y) / y == x);
    }

    // Buy Tokens
    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice));   // Require that value is equal to tokens                               
        require(tokenContract.balanceOf(this) >= _numberOfTokens);   // Require that contract has enough tokens
        require(tokenContract.transfer(msg.sender, _numberOfTokens));   // Require that a transfer is successful
        tokensSold += _numberOfTokens;   // Keep track of tokensSold
        emit Sell(msg.sender, _numberOfTokens);   // Trigger sell event
    }

    // Ending Token DappTokenSale
    function endSale() public {
        require(msg.sender == admin);   // Require admin
        require(tokenContract.transfer(admin, tokenContract.balanceOf(this)));  // Transfer remaining dapp tokens to admin
        selfdestruct(admin);  // Destroy contract
    }

}