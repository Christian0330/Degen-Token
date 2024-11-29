// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract degenToken is ERC20 {
    address private admin;

    uint256 private constant MAX_SUPPLY = 500000;

    event TokenMinted(address indexed recipient, uint256 amount);
    event TokenBurned(address indexed burner, uint256 amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Access denied: Admin only");
        _;
    }

    modifier mintLimit(uint256 amount) {
        require(totalSupply() + amount <= MAX_SUPPLY, "Minting exceeds max supply");
        _;
    }

    constructor(uint256 initialSupply) ERC20("Degen", "DGN") {
        _mint(msg.sender, initialSupply);
        admin = msg.sender;
    }

    function mintTokens(address recipient, uint256 amount) external onlyAdmin mintLimit(amount) {
        _mint(recipient, amount);
        emit TokenMinted(recipient, amount);
    }

    function sendTokens(address to, uint256 amount) public returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
        emit TokenBurned(msg.sender, amount);
    }
}
