// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract RewardPool {



    uint256 public pool;



    mapping(

        address=>uint256

    )

    public rewards;





    event RewardAdded(

        address user,

        uint256 amount

    );







    function deposit()

    external

    payable

    {


        pool += msg.value;


    }






    function assignReward(

        address user,

        uint256 amount

    )

    external

    {



        require(

            amount <= pool,

            "Not enough"

        );




        rewards[user]+=amount;


        pool-=amount;



        emit RewardAdded(

            user,

            amount

        );


    }







    function claim()

    external

    {


        uint256 amount=

        rewards[msg.sender];



        require(

            amount>0,

            "No reward"

        );



        rewards[msg.sender]=0;



        payable(msg.sender)

        .transfer(amount);


    }



}
