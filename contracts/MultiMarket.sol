// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract MultiMarket {


    uint256 public marketId;



    struct Market {


        uint256 id;


        string title;


        uint256 totalVolume;


        bool active;


    }





    mapping(

        uint256 => Market

    )

    public markets;






    event MarketCreated(

        uint256 id,

        string title

    );




    event VolumeAdded(

        uint256 id,

        uint256 amount

    );







    function createMarket(

        string memory title

    )

    external

    {


        marketId++;



        markets[marketId]=Market({

            id:marketId,

            title:title,

            totalVolume:0,

            active:true

        });




        emit MarketCreated(

            marketId,

            title

        );


    }






    function addVolume(

        uint256 id

    )

    external

    payable

    {


        require(

            markets[id].active,

            "Inactive"

        );



        markets[id]

        .totalVolume += msg.value;




        emit VolumeAdded(

            id,

            msg.value

        );


    }






    function closeMarket(

        uint256 id

    )

    external

    {


        markets[id].active=false;


    }






    function getMarket(

        uint256 id

    )

    external

    view

    returns(

        Market memory

    )

    {


        return markets[id];


    }



}
