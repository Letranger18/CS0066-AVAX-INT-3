// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract JBasket is ERC20, Ownable {

    string private constant _name = "Essential Gold Goods";
    string private constant _symbol = "EGG";
    uint8 private constant _decimals = 18;
    uint256 private constant _initialSupply = 100;

    constructor() ERC20(_name, _symbol) {
        _mint(msg.sender, _initialSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != msg.sender, "You cannot mint tokens to your own account!");
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "You cannot burn an amount of 0 or less!");
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(msg.sender != to, "You cannot transfer tokens to your own account!");
        return super.transfer(to, amount);
    }
}
