// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Mycontract{
    uint user=0;
    uint checkbet=0;
    uint checkuser=0;
    uint checkrewardbet=0;
    mapping(uint => uint) public Users;
    mapping(uint => uint) public UsersBet;
     mapping(uint => uint) public UsersBetAmount;
      mapping(uint => uint) public UserWin;
     function checkresult(uint usernumber) public view returns (string memory)
     {
             if(UserWin[usernumber]==1)
             return "win";
     }
    function rewardBet() public
    {
        if(checkbet==1 && checkuser==1){
        uint coin=uint(keccak256(abi.encodePacked(block.timestamp,
                                          block.difficulty,
                                          msg.sender)))%2;
       for(uint i=1;i<=user;i++){
            if(UsersBet[i]!=2)
            {
                if(UsersBet[i]==coin){
                Users[i]+=UsersBetAmount[i]*2;
                UsersBetAmount[i]=0;
                UserWin[i]=1;

                }
            }
        }
        checkrewardbet=1;
        }
        
    

    }
    function Bet(uint localuser,uint amount,uint bet)public 
    {
        if(localuser<=user){
        if(Users[localuser]>=amount){
        UsersBetAmount[localuser]=amount;
        Users[localuser]-=amount;
        UsersBet[localuser]=bet;
        }
        checkbet=1;
        }
    }
    function CreateUser() public {
           user++;
         Users[user]=100;
         UsersBet[user]=2;
         UsersBetAmount[user]=0;
       
         checkuser=1;
         UserWin[user]=0;

    }
}
