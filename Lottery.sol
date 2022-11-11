// SPDX-License-Identifier: MIT
import  "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3interface.sol";

pragma solidty ^0.6.6;

contract Lottery{
    address payable [] public players;
    uint256 usdEntryFee;
    AggregatorV3Interface internal ethUsdPriceFeed;

constructor (address _priceFeedAddress)public{
    usdEntryFee = 50 * (10 **18);
    ethUsdPriceFeed = AggregatorV3Interface(_priceFeedAddress); 
}

function enter()public  payable {
   //atleast 50
   players.push(msg.sender);

}
function getEntranceFeee()public view returns(uint256) {

    // ? what the entrance fee is
    (,int price,,,,)=ethUsdPriceFeed.latestRoundData;
     // 50 /2000 /ETH
     // 50 * 10000 / 2000
     int udjustedPrice = uint256(price)* 10  **10;//18 decimals

     uint256 costToEnter=(usdEntryFee * 10 **18)/price 
     returns costToEnter;
}

function startLottery()public{}

function endLottery()public{}
}