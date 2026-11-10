// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid new owner");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}

contract ProtectedVault is Ownable {
    // Kế thừa Ownable, quản lý tiền gửi và rút ETH an toàn
    function deposit() public payable {
        require(msg.value > 0, "Must send ETH");
    }

    function withdraw(address payable to, uint256 amt) public onlyOwner {
        require(amt <= address(this).balance, "Insufficient balance");
        (bool success, ) = to.call{value: amt}("");
        require(success, "Transfer failed");
    }

    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}