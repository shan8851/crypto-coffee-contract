// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {CryptoCoffee} from "../src/CryptoCoffee.sol";

contract DeployCryptoCoffee is Script {
    function run() external returns (CryptoCoffee) {
        vm.startBroadcast();
        CryptoCoffee cryptoCoffee = new CryptoCoffee();
        vm.stopBroadcast();
        return cryptoCoffee;
    }
}
