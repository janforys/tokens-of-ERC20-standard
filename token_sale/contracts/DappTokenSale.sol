pragma solidity ^0.4.2;

import "./DappToken.sol";

contract DappTokenSale {
    address admin;
    DappToken public tokenContract;
    uint256 public tokenPrice;

    constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;     // Assign an admin
        tokenContract = _tokenContract;     // Token contract
        tokenPrice = _tokenPrice;    // Token price
    }

}