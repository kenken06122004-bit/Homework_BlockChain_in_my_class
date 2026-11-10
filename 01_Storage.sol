// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    uint256 private storedData; // Biến trạng thái lưu trữ

    // Khai báo sự kiện theo yêu cầu đề bài
    event ValueSet(address indexed who, uint256 newValue);

    // Hàm khởi tạo giá trị ban đầu khi deploy
    constructor (uint256 _init) { 
        storedData = _init;
    }

    // Hàm cập nhật giá trị và phát ra sự kiện
    function set (uint256 _value) public {
        storedData = _value;
        emit ValueSet(msg.sender, _value);
    }

    // Hàm đọc giá trị (view function không tốn gas)
    function get() public view returns (uint256) {
        return storedData;
    }
}