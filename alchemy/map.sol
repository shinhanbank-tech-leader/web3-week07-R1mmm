// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address=>User) public users;

	function createUser() external {
		require(!users[msg.sender].isActive,"Already existed!");
		
		User memory user = User(100,true);

		users[msg.sender] = user;
	}

	function transfer (address _address, uint amount) external{
		require(users[msg.sender].isActive && users[_address].isActive && users[msg.sender].balance >= amount,"Fail!");

		users[msg.sender].balance -= amount;
		users[_address].balance += amount;	
		
	}

}
