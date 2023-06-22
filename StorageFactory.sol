// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

// This is a contract that can deploy SimpleStorage contract and also interact with the contract at the same time.

contract StorageFactory {

    // stores in a state variable and is overwritten
    SimpleStorage public simpleStorage;

    function createSimpleStorage() public {
        simpleStorage = new SimpleStorage();
    }

    // stores contract's addresses in an array
    SimpleStorage[] public listOfSimpleStorageContracts;

    function deploySimpleStorageToArray() public {
        SimpleStorage mySimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(mySimpleStorage);
    }

    // interacting with the simplestorage contract

    function storeFactoryStore(uint256 _currentContractIndex, uint256 _yourFavNum) public {
        SimpleStorage mySimpleStorageContract = listOfSimpleStorageContracts[_currentContractIndex];
        mySimpleStorageContract.setFavoriteNumber(_yourFavNum);
    }

    function getFactoryStore(uint256 _currentContractIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_currentContractIndex].getFavoriteNumber();
    }


}
