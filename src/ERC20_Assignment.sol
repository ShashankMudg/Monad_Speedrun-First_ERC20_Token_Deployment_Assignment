//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../lib/openzeppelin-contracts/contracts/utils/Pausable.sol";
import "../lib/openzeppelin-contracts/contracts/access/AccessControl.sol";


/// @title : Assignment 3 ERC20 Token Contract
/// @author : Shashank Mudgal
/// @notice : This contract is an ERC20 token contract with minting, burning, pausing, and role-based access control functionalities.
/// @dev : Inherits from OpenZeppelin's ERC20, Ownable, Pausable, and AccessControl contracts.
/// @dev : The contract allows the owner to grant and revoke roles, and accounts with the minter and burner role can mint and burn tokens when the contract is not paused.
/// @dev : After deployment, the owner can assign the minter and burner role to specific accounts.
/// @dev : The owner have to grant MINTER_AND_BURNER_ROLE to itself in order to mint and burn functions
/// @dev : Initial supply of 100 tokens is minted to the deployer's address upon deployment.
/// @dev : The rest of the functions like transfer, approve, transferFrom are inherited from ERC20 standard implementation.

contract Assignment3 is ERC20 , Ownable, Pausable, AccessControl {

    /// @dev : Role identifier for minter and burner role
    bytes32 public mint_and_burn_role = keccak256("MINTER_AND_BURNER_ROLE");

    constructor() ERC20("Assignment3Token", "ATK3") Ownable(msg.sender) {
        _mint(msg.sender, 100);
    }


    /// @dev : Grant role to an account
    /// @param role : Role identifier
    /// @param account : Address of the account
    /// @notice : Only owner can grant roles
    function grantRole(bytes32 role, address account) public override onlyOwner  {
        _grantRole(role, account);
    }

    /// @dev : Revoke role from an account
    /// @param role : Role identifier
    /// @param account : Address of the account
    /// @notice : Only owner can revoke roles
    function revokeRole(bytes32 role, address account) public override onlyOwner() {
        _revokeRole(role, account);
    }


    /// @dev : Mint tokens to the caller's account
    /// @param _user : Address of the user to mint tokens to
    /// @param amount : Amount of tokens to mint
    /// @notice : Only accounts with mint_and_burn_role can mint tokens when not paused
    function mint(address _user, uint amount) public onlyRole(mint_and_burn_role ) whenNotPaused {
        _mint(_user, amount);
    }

    /// @dev : Burn tokens from the caller's account
    /// @param _user : Address of the user to burn tokens from
    /// @param amount : Amount of tokens to burn
    /// @notice : Only accounts with mint_and_burn_role can burn tokens when not paused
    function burn(address _user,uint amount) public onlyRole(mint_and_burn_role ) whenNotPaused {
        _burn(_user, amount);
    }

    /// @dev : Get the balance of a user
    /// @param _user : Address of the user
    function balanceOf(address _user) public view override returns (uint) {
        return super.balanceOf(_user);
    }

    /// @dev : Pause the contract
    /// @notice : Only owner can pause the contract
    function pause() public onlyOwner {
        _pause();
    }

    /// @dev : Unpause the contract
    /// @notice : Only owner can unpause the contract
    function unpause() public onlyOwner {
        _unpause();
    }

}