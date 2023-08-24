require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity:
  { version: "0.8.18",
  settings: {
    optimizer: {
      enabled: true,
      runs: 200
    },
    // evmVersion : 'shanghai'
  },},
  networks: {
    sepolia: {
      url: process.env.RPC_URL,
      accounts: [process.env.PRIVATE_KEY],
    },
    'base-goerli': {
      url: 'https://goerli.base.org',
      accounts: [process.env.PRIVATE_KEY],
      gasPrice: 1000000000,
    },
  },
  etherscan: {
    apiKey:{ 
  sepolia: process.env.ETHERSCAN_API_KEY,
  "base-goerli": process.env.BLOCKSCOUT_KEY,
}, 
  customChains: [
    {
      network: "base-goerli",
      chainId: 84531,
      urls: {
       apiURL: "https://base-goerli.blockscout.com/api",
       browserURL: "https://base-goerli.blockscout.com"
      }
    }
  ]
      

  },
  gasReporter: {
    enabled: true,
    currency: "USD",
    noColors: false,
    // coinmarketcap: process.env.COINMARKETCAP_API_KEY,
},
contractSizer: {
    runOnCompile: true,
    only: [],
},
};
