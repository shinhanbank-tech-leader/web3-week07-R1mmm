// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    uint[] public evenNumbers;
    
    function filterEven (uint[] calldata _arr) external{
        for (uint i=0; i<_arr.length; i++){
            if (_arr[i]%2 == 0){
                evenNumbers.push(_arr[i]);
            }
        }
    }
    
}
