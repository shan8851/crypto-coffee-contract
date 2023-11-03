// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract CryptoCoffee {
  address public owner;
  uint256 public coffeeCount;

  event CoffeePurchased(address indexed buyer, uint256 amount);
  event Withdrawn(address indexed withdrawer, uint256 amount);

  constructor() {
    // Set the contract creator as the owner
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can call this function");
    _;
  }

  // Function to buy a coffee
  function buyCoffee() external payable {
    require(msg.value > 0, "Coffee's aren't free!");
    coffeeCount += 1;

    emit CoffeePurchased(msg.sender, msg.value);
  }

  function withdraw() external onlyOwner {
    uint256 balance = address(this).balance;
    require(balance > 0, "Balance is empty");

    (bool success, ) = owner.call{value: balance}("");
    require(success, "Failed to send Ether");

    emit Withdrawn(owner, balance);
  }
}
