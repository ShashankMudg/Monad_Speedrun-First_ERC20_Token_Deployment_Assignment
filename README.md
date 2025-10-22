# 🪙 Assignment 3 — ERC20 Token Deployment

## 📜 Contract Information

| Field | Details |
|--------|----------|
| **Network** | Monad Testnet |
| **Deployed Contract Address** | `0xb85C2Dbf3c47EEEF458cFa5ceC08A7C7B97d972a` |
| **View on Monadscan / Monvision** | [🔗 View Verified Contract](https://testnet.monadscan.com/address/0xb85C2Dbf3c47EEEF458cFa5ceC08A7C7B97d972a#code) |
| **Deployer** | `0xA9243FC4D13CD486C083D27f9Cb109aF5Ee82Ee6` |
| **Status** | ✅ Verified |

---

## 📘 Overview
This project is part of the **Monad Speedrun Assignment**.  
The goal is to **deploy an ERC20 token** on the Monad testnet with **two roles** and implement features such as **pausing**, **minting**, and **role-based access control**.

---

## 🎯 Assignment Requirements
> **Deploy an ERC20 token with 2 roles:**
> - **Admin:** Can pause/unpause the contract, manage roles, and transfer ownership.  
> - **Minter:** Can mint (and burn) tokens when the contract is not paused.  
>
> **Tasks:**
> 1. Deploy the token using **Remix**.  
> 2. Verify the contract on **Monvision** or **Monadscan**.  
> 3. Submit:
>    - GitHub repo link  
>    - Smart contract address  

---

## 🧱 Smart Contract Details

| Property | Value |
|-----------|--------|
| **Contract Name** | `Assignment3` |
| **Token Name** | `Assignment3Token` |
| **Symbol** | `ATK3` |
| **Initial Supply** | `100` tokens (minted to deployer) |
| **Solidity Version** | `^0.8.0` |
| **License** | MIT |
| **Frameworks Used** | OpenZeppelin Contracts |

---

## ⚙️ Features

| Feature | Description |
|----------|--------------|
| **ERC20 Standard** | Implements OpenZeppelin’s ERC20 interface |
| **Ownable** | Ownership-based access for administrative tasks |
| **AccessControl** | Custom role-based permissions for minters |
| **Pausable** | Admin can pause/unpause all token activities |
| **Minting & Burning** | Minters can mint or burn tokens |
| **Initial Supply** | 100 tokens automatically minted to the deployer address |

---

## 🧩 Roles

| Role | Description | Assigned To |
|------|--------------|-------------|
| **Owner (Admin)** | Can pause/unpause contract, grant/revoke roles, transfer ownership | Deployer by default |
| **MINTER_AND_BURNER_ROLE** | Can mint and burn tokens when contract is not paused | Must be granted manually by owner |

**Example (grant minter role):**
```solidity
grantRole(mint_and_burn_role, 0xYourMinterAddress);
