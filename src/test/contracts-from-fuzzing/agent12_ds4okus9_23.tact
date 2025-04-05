message WithAddress {
  addr: Address;
}

contract Test {
  receive(msg: WithAddress) {}
}