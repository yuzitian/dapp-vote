pragma solidity ^0.5.1;

contract vote {

    mapping (address => bool) public votesReceived;
    address[] public candidateList;
    address destination_address;
    uint256 final_result;
    bool command = false;
    bool flag = false;
    
    event add_voter(address candidate);
    event voting(address candidate);
    event get_final(address candidate);
    event reset(address creater);
    event delete_voter(address candidate);
    
    function add_candidate(address candidate) public returns (uint) {
        require(vaildcreater());
        for(uint i=0; i < candidateList.length; i++){
            if(candidateList[i] == candidate){
                return 0;
            }
        }
        candidateList.push(candidate);
        votesReceived[candidate] = false;
        emit add_voter(candidate);
        return 1;
    }
    
    function remove_candidate(address candidate) public {
        require(vaildcreater());
        for(uint i=0; i < candidateList.length; i++){
            if(candidateList[i] == candidate){
                address swap;
                swap = candidateList[i];
                candidateList[i] = candidateList[candidateList.length - 1];
                candidateList[candidateList.length - 1] = swap;
                candidateList.pop();
                break;
            }
        }
        emit delete_voter(candidate);
    }

    function voteForCandidate() public {
        require(validCandidate(msg.sender));   
        require(validVote(msg.sender));
        final_result += 1; 
        votesReceived[msg.sender] = true;
        emit voting(msg.sender);
    }   
    
    function r_command() public returns (string memory) {
        totalVotesFor();
        emit get_final(msg.sender);
        if (command == true) {
            return "command issue";
        } else {
            return "command not issue";
        }
    }
    
    function reset_command() public {
        require(vaildcreater());
        command = false;
        final_result = 0;
        for(uint i=0; i < candidateList.length; i++){
           votesReceived[candidateList[i]] = false;
        }
        emit reset(msg.sender);
    }
    
    function vaildcreater() view public returns (bool) {
        if(msg.sender == 0x1741Ec49De7579a8eFD1A5CFfB0C22c9e4772C97){
            return true;
        } else {
            return false;
        }
    }

    function validCandidate(address candidate) view public returns (bool) {
        for(uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;  
            }      
        }    
        return false;   
    }
    
    function validVote(address candidate) view public returns (bool) {
        require(validCandidate(candidate));
        if(votesReceived[candidate] == true){
            return false;
        }
        else{
            return true;
        }
    }
    
    function y_r_candidateList() public {
        require(validCandidate(msg.sender));
        flag = true;
    }
    
    function r_candidateList() public returns (address[] memory){
        if (flag == true) {
            flag = false;
            return candidateList;
        }
    }

    
    function totalVotesFor() public {
        if (final_result > candidateList.length / 2){
            command = true;
        }
    }
}
