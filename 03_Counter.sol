// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;
    uint256 public constant MAX = 100;

    // Khai báo các sự kiện theo yêu cầu đề bài
    event Incremented(address indexed user, uint256 newCount);
    event Decremented(address indexed user, uint256 newCount);
    event Reset(address indexed user);

    // Hàm tăng giá trị (giới hạn tối đa là 100)
    function increment() public {
        require(count < MAX, "Max limit reached at 100");
        count++;
        emit Incremented(msg.sender, count);
    }

    // Hàm giảm giá trị (không được nhỏ hơn 0)
    function decrement() public {
        require(count > 0, "Count is zero");
        count--;
        emit Decremented(msg.sender, count);
    }

    // Hàm đặt lại bộ đếm về 0 (chỉ thực hiện qua lời gọi tường minh)
    function reset() public {
        count = 0;
        emit Reset(msg.sender);
    }
}