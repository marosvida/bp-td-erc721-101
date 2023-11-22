// Deploying the TD somewhere
// To verify it on Etherscan:
// npx hardhat verify --network sepolia <address> <constructor arg 1> <constructor arg 2>

const hre = require("hardhat");
const Str = require('@supercharge/strings')

async function main() {
  // Deploying contracts
  const ExerciseSolution = await hre.ethers.getContractFactory("MyExercise");
  const exerciseDeployed = await ExerciseSolution.deploy();
  
  
  console.log(
    `ExerciseSolution deployed at  ${exerciseDeployed.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
