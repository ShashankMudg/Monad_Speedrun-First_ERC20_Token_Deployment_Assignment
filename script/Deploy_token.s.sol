// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../src/ERC20_Assignment.sol";

contract deploytoken is Script {
    
    Assignment3 token;
    function run() external returns(Assignment3){
        vm.startBroadcast();
        token = new Assignment3();
        return token;
        vm.stopBroadcast();
    }
}