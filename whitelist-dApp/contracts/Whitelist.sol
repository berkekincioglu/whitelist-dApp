//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Whitelist {
    uint8 public maxWhiteListedAddresses;
    mapping(address => bool) public whiteListedAddresses;
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhiteListedAddresses) {
        maxWhiteListedAddresses = _maxWhiteListedAddresses;
    }

    function addAddressToWhitelist() public {
        require(
            !whiteListedAddresses[msg.sender],
            "Address already whitelisted"
        );
        require(
            numAddressesWhitelisted < maxWhiteListedAddresses,
            "Whitelist is full"
        );
        whiteListedAddresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}
