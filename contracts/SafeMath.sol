pragma solidity ^0.4.18;

library SafeMath {
    
    /**
     *  Sub function asserts that b is less than or equal to a.
     * */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
    * Add function avoids overflow.
    * */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}
