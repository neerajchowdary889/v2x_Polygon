pragma solidity >= 0.8.0;
    contract message{
        // to store input messgae to an array 
        string[] public message_array;
        // to count ture , false vote for msgs
        uint[] public vote_ballet;
        // message choosen for voting
        string public message;
        // yes count for msg 
        uint public count_true = 0;
        // NO count for msg 
        uint public count_false = 0;

        bool public msg_status;


    // All messages transmitted from the
    // v2x ecosystem are collected by the function messageArray(),
    // which then saves them to an array. The array that holds
    // messages is referred to as the message array, which accepts
    // input in strings. The total amount of messages that are kept in
    // this array is what is returned whenever this function is called


    //( to store messge from user input to array) 
    function messageArray(string memory msg1) public returns(uint){
        message_array.push(msg1);
        uint messageCount = message_array.length;
        return messageCount;
    }

    // The selectMessage() function is used to choose a message
    // to be sent for voting. As an input, this function takes the
    // message’s index number stored in the array as a parameter.
    // When this function is called, the message located at the
    // specified index being passed to it as the input is shown.

    // Select message for voting process
    function selectMessage(uint mesgNo) public returns(string memory){ 
        message = message_array[mesgNo];
        return message;
                
    }

    // which will be used to vote for the incoming
    // messages, and the values taken for the vote for the messagesare 
    // boolean values. This function accepts votes as input and
    // then adds them to the vote ballet array

    //  pushes vote for msg to the array [vite ballet]
    function vote(uint oneZero) public returns(uint[] memory){
        vote_ballet.push(oneZero);
        return vote_ballet;
    }
    

    // Function to remove votes
    function removeVote() public{
        uint len = vote_ballet.length;
        for (uint i = 0; i< len; i++){
            vote_ballet.pop();
        }
    }


    // the countVote() function, which
    // counts the true and false counts of each message being sent
    // to the verification process

 // to count the no of yes, no for a messge 
    function countVote() public returns(uint, uint){
        for (uint i = 0; i<vote_ballet.length; i++){
            if (vote_ballet[i] == 1){
                count_true = count_true + 1;
            }
            if (vote_ballet[i] == 0){
                count_false = count_false + 1;
            }
        }
        return (count_true,count_false);
    }

    //  It is the responsibility of the Validate() method to determine
    // whether or not the incoming message can be trusted. This
    // function accepts a true and a false count as input and provides
    // back the status of the input message, indicating whether the
    // message was trustworthy or not reliable.

    function Validate() public returns(bool){
        uint total = vote_ballet.length;
        if(count_true>count_false){
            msg_status = true;
        }
        else{
            msg_status = false;
        }
        return msg_status;
        
    }








    }