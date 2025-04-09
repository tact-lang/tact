message WithAddressMap {
  addrMap: map<Address, Int>;
}

contract Test {
  receive(msg: WithAddressMap) {}
}