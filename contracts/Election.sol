pragma solidity ^0.5.0;

contract Election {
   struct Candidate {
      uint id;
      string name;
      uint voteCount;
   }
   mapping (address => bool) public voters;
   mapping (uint => Candidate) public candidates;

   uint public candidatesCount;

   constructor() public {
     addCandidate("Akanshu");
   }

   function addCandidate(string memory _name) public {
      candidatesCount++;
      candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
   }

   function vote(uint _candidateId) public {
      require(!voters[msg.sender]);
      require(_candidateId > 0 && _candidateId <= candidatesCount);
      voters[msg.sender] = true;
      candidates[_candidateId].voteCount ++;
   }
}
