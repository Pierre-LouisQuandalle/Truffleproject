// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


//contract Mytoken is ERC20 {
  ///  constructor() ERC20("MyCollectible", "MCO") {
    ///}


  
///}
import "./Auth.sol";

contract Box {
    uint256 private value;
    Auth private auth;

    event ValueChanged(uint256 newValue);

    constructor(Auth _auth) public {
        auth = _auth;
    }

    function store(uint256 newValue) public {
        // Require that the caller is registered as an administrator in Auth
        require(auth.isAdministrator(msg.sender), "Unauthorized");

        value = newValue;
        emit ValueChanged(newValue);
    }

    function retrieve() public view returns (uint256) {
        return value;
    }
}