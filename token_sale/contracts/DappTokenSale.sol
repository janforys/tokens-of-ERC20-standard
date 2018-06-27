pragma solidity ^0.4.2;

import "./DappToken.sol";

contract DappTokenSale {
    address admin;
    DappToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;     // Assign an admin
        tokenContract = _tokenContract;     // Token contract
        tokenPrice = _tokenPrice;    // Token price
    }

    //Buy Tokens
    function buyTokens(uint256 _numberOfTokens) public payable {
        // Require that value is equal to tokens
        // Require that contract has enough tokens
        // Require that a transfer is successful
        tokensSold += _numberOfTokens;   // Keep track of tokenSold
        // Trigger sell event
    }

}