// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function relay(address hero, bytes memory data) external {
        // 이미 조립이 끝난 data가 들어왔으므로 
        // 추가 인코딩 없이 그대로 call의 인자로 넣기
        (bool success, ) = hero.call(data);
        
        require(success, "Relay to hero failed!");
        
    }
}
