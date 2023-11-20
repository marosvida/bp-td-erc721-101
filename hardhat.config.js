require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    hardhat: {
    },
    goerli: {
      url: "https://goerli.infura.io/v3/" + process.env.infura,
      accounts: [process.env.privateKey]
    },
    sepolia: {
      url: "https://sepolia.infura.io/v3/" + process.env.infura,
      accounts: [process.env.privateKey],
    }
  },
  solidity: {
    version: "0.8.18",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  etherscan: {
    apiKey: process.env.etherscan,
  },
};
