# DegenToken Smart Contract

**DegenToken** (`DGN`) is an ERC20-compliant token designed for managing a maximum-supply cryptocurrency. This contract enables minting, burning, and transferring tokens, enforcing a strict cap to ensure token scarcity.

---

## Features

### **Minting Tokens**
- **Admin-only Access:** Only the admin can mint new tokens.
- **Maximum Supply Limit:** The total supply cannot exceed **300,000 DGN**.

### **Burning Tokens**
- **Token Holders Control:** Any token holder can burn their own tokens to permanently reduce the circulating supply.

### **Token Transfers**
- Standard ERC20 token transfer functionality is supported.

---

## Contract Details
- **Token Name:** DegenToken  
- **Symbol:** DGN  
- **Maximum Supply:** 300,000 DGN  
- **Initial Supply:** Configurable during deployment  

---

## Functions

### **`constructor(uint256 initialSupply)`**
Initializes the contract and mints the specified `initialSupply` to the deployer's address.  
#### Parameters:
- `initialSupply (uint256)`: Number of tokens to mint upon deployment.

---

### **`mintTokens(address recipient, uint256 amount)`**
Allows the admin to mint new tokens to the specified `recipient` address, subject to the **300,000 DGN** maximum supply cap.  
#### Modifiers:
- `onlyAdmin`: Restricts access to the admin.
- `mintLimit`: Ensures total supply does not exceed the cap.
#### Parameters:
- `recipient (address)`: Address to receive the minted tokens.
- `amount (uint256)`: Number of tokens to mint.

---

### **`sendTokens(address to, uint256 amount)`**
Transfers tokens from the sender's account to the specified `to` address.  
#### Parameters:
- `to (address)`: Recipient's address.
- `amount (uint256)`: Number of tokens to transfer.  
#### Returns:
- `bool`: Returns `true` upon successful transfer.

---

### **`burnTokens(uint256 amount)`**
Allows token holders to burn their own tokens, reducing the total supply permanently.  
#### Parameters:
- `amount (uint256)`: Number of tokens to burn.

---

## Events

- **`TokenMinted(address indexed recipient, uint256 amount)`**  
  Emitted when tokens are successfully minted.  
- **`TokenBurned(address indexed burner, uint256 amount)`**  
  Emitted when tokens are successfully burned.

---

## Usage Notes

- **Initial Deployment:**  
  Ensure an appropriate `initialSupply` is set when deploying the contract.  
- **Minting:**  
  Only the admin (deployer by default) can mint tokens, and the contract enforces the total supply limit.  
- **Burning & Transfers:**  
  Token holders can freely burn or transfer their tokens as needed.

---

## Deployment Instructions (Example: Using Remix IDE)
1. Compile the contract using **Solidity v0.8.18**.  
2. Deploy with the desired initial supply (e.g., `10000` for 10,000 DGN).  
3. Use the admin's address to mint or manage tokens.  

---

## Author
**Metacrafter Chris_Narumi**  

## License
This project is licensed under the **MIT License**. See the `LICENSE.md` file for more details.

--- 

