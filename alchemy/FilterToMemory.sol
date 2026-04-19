// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function filterEven(uint[] calldata _arr) external pure returns (uint[] memory) {
        uint count = 0;
        for (uint i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                count++;
            }
        }

        uint[] memory result = new uint[](count);


        uint j = 0;
        for (uint i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                result[j] = _arr[i];
                j++; // 다음 짝수를 넣을 위치로 이동
            }
        }

        return result;
    }
}
