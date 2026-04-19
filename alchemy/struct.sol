// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;

	function hasVoted (address _address) public view returns (bool){
		for (uint i = 0; i<votes.length; i++){
			if (votes[i].voter == _address){
				return true;
			}
		}

		return false;
	}

	function createVote(Choices choice) external {
		require(!hasVoted(msg.sender), "Already has voted!");
		
		Vote memory vote = Vote(choice, msg.sender);

		votes.push(vote);
		// TODO: add a new vote to the array of votes state variable
	}


	function findChoice (address _address) external view returns (Choices){
		for (uint i = 0; i<votes.length; i++){
			if (votes[i].voter == _address){
				return votes[i].choice;
			}
		}
	}

	function changeVote (Choices choice) external {
		require(hasVoted(msg.sender), "They do not have an existing vote!");
		
		for (uint i = 0; i<votes.length; i++){
			if (votes[i].voter == msg.sender){
				votes[i].choice = choice;
			}
		}
	}
}
