pragma solidity ^0.4.18;

import "./ERC20Basic.sol";
import "./SafeMath.sol";

contract BasicToken is ERC20Basic {

    using SafeMath for uint256;

    //keeps a record of the total balances of each ETH address.
    mapping (address => uint256) balances;

    modifier onlyPayloadSize(uint size) {
        if (msg.data.length < size + 4) {
        revert();
        }
        _;
    }

    /**
     * Transfer function makes it possible for users to transfer their Hire tokens to another
     * ETH address.
     * 
     * @Param _to, the address of the recipient.
     * @Param _amount, the amount of Hire tokens to be sent.
     * */
    function transfer(address _to, uint256 _amount) public onlyPayloadSize(2 * 32) returns (bool) {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        Transfer(msg.sender, _to, _amount);
        return true;
    }

    /**
     * BalanceOf function returns the total balance of the queried address.
     * 
     * @Param _addr, the address which is being queried.
     * */
    function balanceOf(address _addr) public constant returns (uint256) {
        return balances[_addr];
    }
}
