# NFTICKETX
https://nfticketx.vercel.app/
## Overview


Traditional ticketing systems often suffer from issues like fraud, counterfeiting, lack of transparency, and centralized control. Our Decentralized NFT Ticketing Platform addresses these challenges by utilizing blockchain technology and NFTs to bring the following benefits:

- **Security and Authenticity**: Each ticket is represented as a unique NFT, making it practically impossible to counterfeit. The ownership and transaction history of each ticket are stored on the blockchain, ensuring its authenticity.

- **Transparency**: The blockchain's transparent nature enables users to verify the legitimacy of tickets, track their ownership history, and prevent unauthorized changes.

- **Elimination of Intermediaries**: By using smart contracts on the blockchain, we eliminate the need for intermediaries, reducing fees and enhancing the direct relationship between event organizers and attendees.

- **Ownership and Transfer**: Attendees truly own their NFT tickets, allowing them to easily transfer, sell, or gift their tickets to others within the platform's framework.

- **Customization**: Event organizers can create unique NFT tickets with customizable attributes, such as limited edition designs, unlockable content, and more, adding extra value to the ticketing experience.


## How the product works

* A user, provided he is wallet is connected to the base-goerli testnet is able to create a ticket for the event.
* As a user uploads a picture, the picture is sent to ipfs and a CID is returned
* The user then goes ahead to fill in the name and description of the ticket
* The user clicks on submit which will submit the picture CID hash along with the name and description to pinata for hashing the metadata. This metadata  is what makes our image viewable on opensea and inside our wallet.
* The User fills in details of the event like the name, location, price, and total supply. Then can create an event.
* The user is able to view his event and people with sufficient base-goerli eth are able to purchase tickets.
* A payment splitter contract is implemented to ensure a percentage of all transactions is sent to the deployer's address.

![Screenshot (57)](https://github.com/NFTTicket-AyaHackathon/NFTICKETX/assets/64756234/f8f20d65-a7d6-4b2f-8c29-fef87d408ca8)
![Screenshot (61)](https://github.com/NFTTicket-AyaHackathon/NFTICKETX/assets/64756234/da02f9a4-4c9c-4e0e-8b87-2c087f6d5335)
![Screenshot (58)](https://github.com/NFTTicket-AyaHackathon/NFTICKETX/assets/64756234/2fdc9d43-3164-4d3c-9200-ad0d45ee0ba0)

The contract is verified on https://base-goerli.blockscout.com/address/0xa53C8A63fe130a0DDCa15Bfcbb9d28e56b99BeDF?tab=contract

