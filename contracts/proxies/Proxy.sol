pragma solidity ^0.4.4;
import "./Owned.sol";

contract Proxy is Owned {
  event Forwarded (address indexed destination, uint value, bytes data );
  event Received (address indexed sender, uint value);

  function () payable { Received(msg.sender, msg.value); }

  function forward(address destination, uint value, bytes data) onlyOwner {
    if (!destination.call.value(value)(data)) { throw; }
    Forwarded(destination, value, data);
  }
}

//CREATABLE PROXY GOES HERE
// contract Proxy is Owned {
//   event Forwarded (address indexed destination, uint value, bytes data );
//   event Received (address indexed sender, uint value);

//   function () payable { Received(msg.sender, msg.value); }

//   function forward(address destination, uint value, bytes data) onlyOwner {
//     if (!destination.call.value(value)(data)) { throw; }
//     Forwarded(destination, value, data);
//   }
// }
