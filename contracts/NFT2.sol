// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";
import "hardhat/console.sol";

contract NFT2 is ERC721, ERC721URIStorage, Ownable, PaymentSplitter {
   
          uint256 public tokenId;
 
    uint256 public ticketPriceNormal;
    uint256 public totalSupplyNormal;
    address public creator;
    uint256 public ticketsAvailableNormal;
    string public baseURI;
     mapping(address => uint256) public purchasePerWallet;
      
    constructor(
        uint256 _ticketPriceNormal,
        string memory _uri,
        uint256 _totalSupplyNormal,
        uint256[] memory _shares,
        address[] memory _payees,
        address _deployer
    ) ERC721("Concert", "CON") PaymentSplitter(_payees, _shares) {
        creator = _deployer;
        baseURI = _uri;
        totalSupplyNormal = _totalSupplyNormal;
        ticketsAvailableNormal = _totalSupplyNormal;
        ticketPriceNormal = _ticketPriceNormal;
        bulkMintTicketsNormal(totalSupplyNormal, _uri);
    }

       function bulkMintTicketsNormal(uint256 _totalSupply,string memory _tokenURI)
        public
        
    {
         for (uint256 i = 0; i < _totalSupply; i++) {
            _mint(msg.sender, i);
            _setTokenURI(i, _tokenURI);
              }
      
    }


  function purchaseNormal(uint256 amount)
        public
        payable
    {
       require(purchasePerWallet[tx.origin] < 3, "you have bought two tickets already");
          require(
             ticketsAvailableNormal > 0,
            "sold out"
       );
        ticketsAvailableNormal -= amount;
                require(msg.value >= ticketPriceNormal * amount, "not enough money sent");
         _transfer(owner(), tx.origin, tokenId);
         purchasePerWallet[tx.origin] += 1;
                 tokenId += 1;
               
    }


    // The following functions are overrides required by Solidity.

    function _burn(uint256 _tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(_tokenId);
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(_tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
    function availableTickets() view public returns(uint256) {
          return ticketsAvailableNormal;
    }
    function TokenId() view public returns(uint256) {
        return tokenId;
    }

}
