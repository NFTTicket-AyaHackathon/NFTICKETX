// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import './NFT2.sol';

import "hardhat/console.sol";
// ticket price should have two costs
// put a limit on how many events that can be created

//there might be need for address;

error NFticket__exceededMaxEvents();




contract NFticket  {


    struct eventInfo {
         uint256 id;
        string name;
        address eventOwner;
        uint256 ticketPriceNormal;
        uint256 totalSupplyNormal;
        string date;
        string location;
        address NFTAddress;
    }

    uint256 public totalEvents;
      address payable public receiver = payable(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955);
    NFT2 private Nftaddress;
  mapping(uint256 => eventInfo) public events;
    mapping (address => uint256) public eventPerWallet;

 uint256[] public _shares = [10,90];
       address[] public _payees = [msg.sender, receiver];

      event eventCreated(
          string  name,
          string  date,
        string  location,
        address  eventOwner,
         uint256 ticketPriceNormal,
         address nftAddress
    );


    function createEvent(  
         string memory _name,
        string memory _date,
        string memory _location,
        uint256  _ticketPriceNormal,
        uint256 _totalSupplyNormal,
        string memory _uri
        )
        external
        returns(address)
      {

        if(eventPerWallet[msg.sender] > 3) {
          revert NFticket__exceededMaxEvents();
        }

        NFT2 nftAddress  =  new NFT2(
              _ticketPriceNormal,
               _uri,
              _totalSupplyNormal,
              _shares,
              _payees,
               msg.sender
          );
           Nftaddress = nftAddress;
          totalEvents++;
          events[totalEvents] = eventInfo({
                id: totalEvents,
                name: _name,
                eventOwner: msg.sender,
                date: _date,
                location: _location,
                ticketPriceNormal: _ticketPriceNormal,
                totalSupplyNormal: _totalSupplyNormal,
                NFTAddress: address(Nftaddress)
          });
           eventPerWallet[msg.sender] += 1;
          emit eventCreated( _name, _date, _location, msg.sender, _ticketPriceNormal, address(Nftaddress));
          return address(Nftaddress);
    }

    function getEvent(uint256 _id) public view returns(eventInfo memory) {
        return events[_id];
    }

    function getTotalEvent() public view returns(uint256) {
       return totalEvents;
    }

function callNft2(uint256 amount) public payable{
   Nftaddress.purchaseNormal{value: msg.value}(amount);
}

receive() external payable {}

fallback() external payable {}

}
