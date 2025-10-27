// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../script/Deploy_token.s.sol";

contract tokentest is Test {
    Assignment3 token ;
    address owner = makeAddr("owner");
    address user1 = makeAddr("user1");
    address user2 = makeAddr("user2");

    function setUp() public {
        vm.prank(owner);
        token = new Assignment3(); 
    }

    function test_Constructor() view public {
        assertEq(token.name(),"Assignment3Token");
        assertEq(token.symbol(),"ATK3");
        assertEq(token.balanceOf(owner),100);
    }

    function test_Grant_And_Revoke_Role() public {
        vm.startPrank(owner);
        token.grantRole(token.mint_and_burn_role(), user1);
        assertTrue(token.hasRole(token.mint_and_burn_role(), user1));

        vm.startPrank(owner);
        token.revokeRole(token.mint_and_burn_role(), user1);
        assertFalse(token.hasRole(token.mint_and_burn_role(), user1));
    }

    function test_Grant_Role_Not_Owner() public {
        vm.startPrank(user1);
        token.grantRole(token.mint_and_burn_role(), user2);
    }

    function test_Mint_And_Burn_With_Permission() public {
        vm.startPrank(owner);
        token.grantRole(token.mint_and_burn_role(), owner);
        token.mint(user1, 50);
        assertEq(token.balanceOf(user1), 50);
    }

    function test_Mint_Without_Permission() public {
        vm.prank(user1);
        vm.expectRevert();
        token.mint(user1, 50);
    }
}
