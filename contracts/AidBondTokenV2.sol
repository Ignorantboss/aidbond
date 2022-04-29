// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";  
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";  
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";  
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";  

contract AidBondToken is Context, Ownable, ERC20, ERC20Pausable, ERC20Burnable {

    uint8 private decimal;
    
    constructor(string memory tokenName, string memory tokenSymbol, uint256 initialSupply, uint8 decimal_) ERC20(tokenName, tokenSymbol) {
        decimal = decimal_;
        initialSupply = initialSupply * (10 ** uint256(decimal));        
        _mint(msg.sender, initialSupply);   
    } 

    function decimals() public view virtual override returns (uint8) {
        return decimal;  
    }
   
    function pause() public virtual onlyOwner {  
       _pause(); 
    }
    
    function unpause() public virtual onlyOwner {
        _unpause();  
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(ERC20, ERC20Pausable) {
        super._beforeTokenTransfer(from, to, amount);
    }
}