message OptionalAddress {
  addr: Address?
}

contract Test {
  receive(message: OptionalAddress) {}
}