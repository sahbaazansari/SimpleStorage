// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.18 <0.9.0;  // solidity version declaration


// Creation of the contract
contract SimpleStorage {

    // favoriteNumber gets initialize to 0 if no value is given
    uint256 private favoriteNumber;

    // hasfavoriteNumber gets initialize to false if no value is given
    bool private hasfavoriteNumber;

    // myAccount is initialize to 0x00 
    address private myAccount;

    // array to store listPeople
    Person[] private listFavNumPeople;

    // mapping to map user's name to their fav number
    mapping(string => uint256) public nameToFavNumberMapping;


    // mapping to map user's name to has fav number = True
    mapping(string => bool) public nameToHasFavBool;


    // struct user
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // main functions

    function setFavNumPersonArray(string memory _name, uint256 _favoriteNumber) public {
        listFavNumPeople.push(Person (_favoriteNumber, _name));
        nameToFavNumberMapping[_name] = _favoriteNumber;
        nameToHasFavBool[_name] = true;
    }

    function getFavNumPersonArray() public view returns(Person[] memory) {
        return listFavNumPeople;
    }

    

    /* getters and setters for all the state variables */
    function setFavoriteNumber(uint256 _favNum) public {
        favoriteNumber = _favNum;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function setHasFavoriteNumber(bool _hasFavNum) public {
        hasfavoriteNumber = _hasFavNum;
    }

    function getHasFavoriteNumber() public view returns (bool) {
        return hasfavoriteNumber;
    }

    function setMyAccount( address _add ) public {
        myAccount = _add;
    }

    function getMyAccount() public view returns(address) {
        return myAccount;
    }


}
