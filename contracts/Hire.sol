pragma solidity ^0.4.18;

import "./AdvancedToken.sol";

contract Hire is AdvancedToken {

    uint8 public decimals;
    string public name;
    string public symbol;
    address public owner;

    /**
    * Constructor initializes the total supply to 100,000,000, the token name to
    * Hire, the token symbol to HIRE, sets the decimals to 18 and automatically 
    * sends all tokens to the owner of the contract upon deployment.
    * */
    function Hire() public {
        totalSupply = 100000000e18;
        decimals = 18;
        name = "Hire";
        symbol = "HIRE";
        owner = 0xaAa34A22Bd3F496b3A8648367CeeA9c03B130A30;
        balances[owner] = totalSupply;
    }
}
