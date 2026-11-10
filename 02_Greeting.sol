// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Greeting {
    string private greeting;
    address public owner;

    // Khai báo sự kiện theo yêu cầu đề bài
    event GreetingChanged(address indexed changer, string newGreeting);

    // Modifier giới hạn chỉ có owner mới được gọi hàm
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Constructor: gán người deploy là owner và thiết lập lời chào mặc định ban đầu
    constructor(string memory _g) {
        owner = msg.sender;
        greeting = _g;
    }

    // Hàm thay đổi lời chào (chỉ owner mới gọi được)
    function setGreeting(string memory _g) public onlyOwner {
        greeting = _g;
        emit GreetingChanged(msg.sender, _g);
    }

    // Hàm đọc lời chào (bất kỳ ai cũng gọi được, là hàm view không tốn gas)
    function greet() public view returns (string memory) {
        return greeting;
    }

    // Hàm đưa lời chào về mặc định 'Hello, World!' (chỉ owner mới gọi được)
    function resetGreeting() public onlyOwner {
        greeting = 'Hello, World!';
        emit GreetingChanged(msg.sender, 'Hello, World!');
    }
}