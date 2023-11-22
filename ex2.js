const hre = require("hardhat");

async function main() {
  // Get the contract factory and deployer (you can change "MyContract" to your contract's name)
  const MyContract = await hre.ethers.getContractFactory("MyExercise");
  const contractAddress = "0x007F9FD515Bc20D1728aB0e33D08609EF1DF6078"; // Replace with your contract's address
  const contract = MyContract.attach(contractAddress);

  // Define the function parameters
  const sex = 0; // Replace with your desired values
  const legs = 4;
  const wings = false;
  const name = "0rQJPfS_rTY052S";

  // Call the declareAnimal function
  await contract.declareAnimal(sex, legs, wings, name);

  console.log("declareAnimal function called successfully.");
}

// Run the script
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
