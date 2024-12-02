// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract JBasket is ERC20, Ownable {

    string private constant _name = "Essential Gold Goods";
    string private constant _symbol = "EGG";
    uint8 private constant _decimals = 18;
    uint256 private constant _totalSupply = 100 * 10**uint256(_decimals);

    constructor() ERC20(_name, _symbol) {
        _mint(msg.sender, _totalSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
