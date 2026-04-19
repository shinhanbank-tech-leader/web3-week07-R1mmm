// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function sum(uint[] calldata _arr) external pure returns (uint){
        uint total = 0;

        for (uint i=0; i<_arr.length; i++){
            total += _arr[i];
        }

        return total;
    }
}
