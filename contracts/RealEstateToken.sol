//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Import statement for the ERC-20 token contract from OpenZeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RealEstateToken is ERC20 {
    address public owner;

    //Used a constructor to initialize the token
    constructor() ERC20("RealEstateToken", "RET") {
        
        //owner is the creator of the contract
        owner = msg.sender;

        //Mint all tokens to owner
        _mint(owner, 1000000 * 10 ** decimals());
    }

    //this function allows the owner to distribute tokens to investors
    function buyTokens(address investor, uint256 amount) public {
        require(msg.sender == owner, "Only the owner can distribute tokens");
        _transfer(owner, investor, amount);
    }
}