// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] public members;

    mapping(address => bool) public isMember;

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a member of the club");
        _;
    }

    constructor() {
        members.push(msg.sender);
        isMember[msg.sender] = true;
    }

    function addMember(address _address) external onlyMember{
        require(!isMember[_address], "Already a member");
        
        members.push(_address);
        isMember[_address] = true;
    }

    function removeLastMember() external onlyMember {
        require(members.length > 0, "No members to remove");
        
        address lastMember = members[members.length - 1];
        isMember[lastMember] = false;
        
        members.pop();
    }

    function checkIsMember(address _address) external view returns (bool) {
        return isMember[_address];
    }
}
