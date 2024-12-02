// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract JBasket is ERC20, Ownable {

    string private constant _name = "Essential Gold Goods";
    string private constant _symbol = "EGG";
    uint256 private _totalSupply = 100;

    constructor() ERC20(_name, _symbol) {
        _mint(msg.sender, _totalSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(amount > 0, "You can only MINT a value that is higher than 0!");
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "You can only BURN a value that is higher than 0!");
        require(balanceOf(msg.sender) >= 0, "Insufficient Funds!");
        require(balanceOf(msg.sender) > amount, "Insufficient Funds!");
        _totalSupply -= amount;
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(msg.sender != to, "You cannot transfer tokens to your own account!");
        require(balanceOf(msg.sender) > amount, "Insufficient Funds!");
        return super.transfer(to, amount);
    }
}
