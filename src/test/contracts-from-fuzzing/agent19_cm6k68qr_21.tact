message Reserved {
  contract: Address;
}

contract Test {
  receive(msg: Reserved) {
    // empty
  }
}