// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./IExerciceSolution.sol";

contract MyExercise is ERC721, IExerciceSolution {

    address ev_addr = 0x43981d9b7f031500f618727B68e554930eE99BB8;

    struct Animal {
        uint sex;
        uint legs;
        bool wings;
        string name;
    }

    Animal[] public animals;
    mapping (uint => address) public animalToOwner;
    mapping (address => bool) public registeredBreeders;

    constructor() ERC721("MyExercise", "ME") {
        _mint(ev_addr, 1);
    }

    // Breeding function
	function isBreeder(address account) external returns (bool) {
        return registeredBreeders[account];
    }

	function registrationPrice() external returns (uint256) {
        return 0;
    }

	function registerMeAsBreeder() external payable {
        registeredBreeders[msg.sender] = true;
        return;
    }

    //declareAnimal(0, 4, false, "0rQJPfS_rTY052S");

	function declareAnimal(uint sex, uint legs, bool wings, string calldata name) external returns (uint256) {
        animals.push(Animal(sex, legs, wings, name));
        uint id = animals.length - 1;
        animalToOwner[id] = ev_addr;
        _mint(ev_addr, id);
        return id;
    }

	function getAnimalCharacteristics(uint animalNumber) external returns (string memory _name, bool _wings, uint _legs, uint _sex) {
        Animal memory animal = animals[animalNumber];
        return (animal.name, animal.wings, animal.legs, animal.sex);
    }

	function declareDeadAnimal(uint animalNumber) external {
        return;
    }

	function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256) {
        return 0;
    }

	// Selling functions
	function isAnimalForSale(uint animalNumber) external view returns (bool) {
        return false;
    }

	function animalPrice(uint animalNumber) external view returns (uint256) {
        return 0;
    }

	function buyAnimal(uint animalNumber) external payable {
        return;
    }

	function offerForSale(uint animalNumber, uint price) external {
        return;
    }

	// Reproduction functions

	function declareAnimalWithParents(uint sex, uint legs, bool wings, string calldata name, uint parent1, uint parent2) external returns (uint256) {
        return 0;
    }

	function getParents(uint animalNumber) external returns (uint256, uint256) {
        return (0, 0);
    }

	function canReproduce(uint animalNumber) external returns (bool) {
        return false;
    }

	function reproductionPrice(uint animalNumber) external view returns (uint256) {
        return 0;
    }

	function offerForReproduction(uint animalNumber, uint priceOfReproduction) external returns (uint256) {
        return 0;
    }

	function authorizedBreederToReproduce(uint animalNumber) external returns (address) {
        return address(0);
    }

	function payForReproduction(uint animalNumber) external payable {
        return;
    }
}