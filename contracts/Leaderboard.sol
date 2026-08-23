// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Leaderboard {



    struct Player {


        address user;


        uint256 points;


        uint256 predictions;



    }




    mapping(

        address=>Player

    )

    public players;





    event ScoreUpdated(

        address user,

        uint256 points

    );






    function addScore(

        address user,

        uint256 score

    )

    external

    {



        Player storage player=

        players[user];




        player.user=user;


        player.points += score;


        player.predictions++;




        emit ScoreUpdated(

            user,

            player.points

        );

    }







    function getPlayer(

        address user

    )

    external

    view

    returns(

        Player memory

    )

    {


        return players[user];


    }


}
