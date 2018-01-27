pragma solidity ^0.4.18;

import "./BasicToken.sol";
import "./ERC20.sol";

contract AdvancedToken is BasicToken, ERC20 {
    
    //keeps a record of all the allowances from one ETH address to another.
    mapping (address => mapping (address => uint256)) allowances; 
    
    /**
     * TransferFrom function allows users to spend ETH on another's behalf, given that the _owner
     * has allowed them to. 
     * 
     * @Param _from, the address of the owner.
     * @Param _to, the address of the recipient.
     * @Param _amount, the total amount of tokens to be sent. '
     * */
    function transferFrom(address _from, address _to, uint256 _amount) public onlyPayloadSize(3 * 32) returns (bool) {
        require(allowances[_from][msg.sender] >= _amount && balances[_from] >= _amount);
        allowances[_from][msg.sender] = allowances[_from][msg.sender].sub(_amount);
        balances[_from] = balances[_from].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        Transfer(_from, _to, _amount);
        return true;
    }

    /**
     * Approve function allows users to allow others to spend a specified amount tokens on
     * their behalf.
     * 
     * @Param _spender, the address of the spended who is being granted permission to spend tokens.
     * @Param _amount, the total amount of tokens the spender is allowed to spend.
     * */
    function approve(address _spender, uint256 _amount) public returns (bool) {
        allowances[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }

    /**
     * Allowance function returns the total allowance from one address to another.
     * 
     * @Param _owner, the address of the owner of the token.
     * @Param _spender, the address of the spender who has or has not been allowed to spend
     * the owners tokens.
     * */
    function allowance(address _owner, address _spender) public constant returns (uint256) {
        return allowances[_owner][_spender];
    }

}
