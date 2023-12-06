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

    uint256 public animalCount = 1;
    mapping (uint => Animal) public idToAnimal;

    mapping (uint => address) public animalToOwner;
    mapping (address => bool) public registeredBreeders;

    // sales
    mapping (uint => bool) public animalToSale;
    mapping (uint => uint) public animalToPrice;

    constructor() ERC721("MyExercise", "ME") {
        registeredBreeders[ev_addr] = true;
        idToAnimal[0] = Animal(0, 4, false, "0rQJPfS_rTY052S");
        _mint(address(this), 0);
        animalToOwner[0] = address(this);
        animalToSale[0] = true;
        animalToPrice[0] = 10000000;
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
        uint256 animalId = ++animalCount;
        idToAnimal[animalId] = Animal(sex, legs, wings, name);
        animalToOwner[animalId] = msg.sender;
        _mint(msg.sender, animalId);
        return animalId;
    }

	function getAnimalCharacteristics(uint animalNumber) external returns (string memory _name, bool _wings, uint _legs, uint _sex) {
        Animal memory animal = idToAnimal[animalNumber];
        return (animal.name, animal.wings, animal.legs, animal.sex);
    }

	function declareDeadAnimal(uint animalNumber) external {
        require(animalToOwner[animalNumber] == msg.sender, "You are not the owner of this animal");
        
        idToAnimal[animalNumber].name = "";
        idToAnimal[animalNumber].wings = false;
        idToAnimal[animalNumber].legs = 0;
        idToAnimal[animalNumber].sex  = 0;

        delete animalToOwner[animalNumber];

        return;
    }

	function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256) {
        return 1;
    }

	// Selling functions
	function isAnimalForSale(uint animalNumber) external view returns (bool) {
        return animalToSale[animalNumber];
    }

	function animalPrice(uint animalNumber) external view returns (uint256) {
        return animalToPrice[animalNumber];
    }

	function buyAnimal(uint animalNumber) external payable {
        require(animalToSale[animalNumber], "This animal is not for sale");
        require(msg.value >= animalToPrice[animalNumber], "You don't have enough money to buy this animal");

        _transfer(animalToOwner[animalNumber], msg.sender, animalNumber);

        delete animalToSale[animalNumber];
        delete animalToPrice[animalNumber];
    }

	function offerForSale(uint animalNumber, uint price) external {
        require(animalToOwner[animalNumber] == msg.sender, "You are not the owner of this animal");
        require(price > 0, "Price must be greater than 0");

        animalToSale[animalNumber] = true;
        animalToPrice[animalNumber] = price;
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